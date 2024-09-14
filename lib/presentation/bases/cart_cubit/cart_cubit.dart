import 'package:flutter/material.dart';

import '../../../application/services/file/file.dart';
import '../../../application/services/product/product.dart';
import '../../../application/services/user_cart/user_cart.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../shared/base_infinite_loading/infinite_loading_cubit.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../ui/cart_screen/widgets/cart_product_item.dart';
import '../../utilities/category_name_resolver.dart';
import '../auth_cubit/auth_cubit.dart';

part 'cart_state.dart';

class CartCubit extends InfiniteLoaderCubit<CartState, CartResponse> {
  CartCubit({
    required super.failureHandlerManager,
    required this.userCartController,
    required this.loadingManager,
    required this.authCubit,
  }) : super(
            initialState: CartState(
          listKey: GlobalKey<AnimatedListState>(),
        )) {
    authCubit.stream.listen((state) {
      if (state is AuthStatusLoggedInState) {
        reload();
      }
    });
  }
  final AuthCubit authCubit;
  final UserCartController userCartController;
  final LoadingManager loadingManager;
  final Duration duration = const Duration(milliseconds: 300);

  void onUpdateQuantity(int cartId, int quantity) async {
    final loadingUpdateCart = userCartController.updateCart(
      id: cartId.toString(),
      request: CartUpdateRequest(quantity: quantity),
    );

    final resultLoading =
        await loadingManager.startLoading(future: loadingUpdateCart);

    resultLoading.mapResult(
      onLeft: (failure) {
        failureHandlerManager.handle(failure);
      },
      onRight: (value) {
        state.productList[cartId]?.quantity = quantity;
        emit(state.copyWith(
          productList: state.productList,
        ));
      },
    );
  }

  void onDeleteCart(int id, int index) async {
    final loadingDeleteCart = userCartController.deleteCart(
      request: CartDeleteRequest(
        ids: [id],
      ),
    );

    final resultLoading =
        await loadingManager.startLoading(future: loadingDeleteCart);

    resultLoading.mapResult(
      onLeft: (failure) {
        failureHandlerManager.handle(failure);
      },
      onRight: (value) {
        final product = state.productList[id]?.cartResponse.product;
        _removeItem(product, index);
        state.productList.remove(id);
        state.selectedProducts.remove(id);
        if (state.totalItemsShow >= 1) {
          state.totalItemsShow -= 1;
        }
        emit(state.copyWith(
          productList: state.productList,
          selectedProducts: state.selectedProducts,
        ));
      },
    );
  }

  void onDeleteAllCart() async {
    final loadingDeleteCart = userCartController.deleteCartAll();

    final resultLoading =
        await loadingManager.startLoading(future: loadingDeleteCart);

    resultLoading.mapResult(
      onLeft: (failure) {
        failureHandlerManager.handle(failure);
      },
      onRight: (value) {
        _removeItems(state.productList.keys.toList());
        state.productList.clear();
        state.selectedProducts.clear();
        state.totalItemsShow = 0;
        emit(state.copyWith(
          productList: state.productList,
          selectedProducts: state.selectedProducts,
          totalItemsShow: state.totalItemsShow,
          selectedAll: false,
        ));
      },
    );
    reload();
  }

  void onDeleteCartSelected() async {
    if (state.selectedProducts.isEmpty) {
      return;
    }
    final ids = state.selectedProducts.keys.toList();

    final loadingDeleteCart = userCartController.deleteCart(
      request: CartDeleteRequest(
        ids: ids,
      ),
    );

    final resultLoading =
        await loadingManager.startLoading(future: loadingDeleteCart);

    resultLoading.mapResult(
      onLeft: (failure) {
        failureHandlerManager.handle(failure);
      },
      onRight: (value) {
        state.selectedProducts.clear();
        _removeItems(ids);
        for (int i = 0; i < ids.length; i++) {
          final key = ids[i];
          state.productList.remove(key);
        }
        if (state.totalItemsShow >= ids.length) {
          state.totalItemsShow -= ids.length;
        }
        emit(state.copyWith(
          productList: state.productList,
          selectedProducts: state.selectedProducts,
          totalItemsShow: state.totalItemsShow,
          selectedAll: false,
        ));
      },
    );
  }

  void _removeItems(List<int> idsToRemove) {
    final List<int> keysList = state.productList.keys.toList();

    for (final int id in idsToRemove) {
      final index = keysList.indexOf(id);
      keysList.removeAt(index);
      _removeItem(state.productList[id]!.cartResponse.product, index);
    }
  }

  void _removeItem(ProductResponse? product, int index) {
    state.listKey.currentState?.removeItem(
      index,
      (context, animation) {
        final List<String> items = [];
        for (final FileResponse image in product?.images ?? []) {
          if (image.previewUrl != null) {
            items.add(image.previewUrl!);
          }
        }
        return CartProductItem(
          selected: false,
          imageUrl: items.isNotEmpty ? items[0] : '',
          title: resolveFieldValueName(context, product?.title) ?? '',
          pricePerUnit: product?.currentPrice ?? 0,
          animation: animation,
        );
      },
      duration: duration,
    );
  }

  void onSelectionChanged(int id, bool value) {
    final Map<int, CartModel> cartMap = {};
    cartMap.addAll(state.selectedProducts);
    bool checkedSelectAll = state.selectedAll;
    if (value) {
      cartMap.addEntries({
        MapEntry(id, state.productList[id]!),
      });
    } else {
      checkedSelectAll = false;
      cartMap.remove(id);
    }
    emit(state.copyWith(
        selectedProducts: cartMap, selectedAll: checkedSelectAll));
  }

  void onSelectionAllChanged(bool value) {
    final Map<int, CartModel> cartMap = {};
    if (value) {
      cartMap.addAll(state.productList);
    }
    emit(state.copyWith(selectedProducts: cartMap, selectedAll: value));
  }

  void resetCart() {
    emit(state.copyWith(
      selectedProducts: {},
      selectedAll: false,
      productList: {},
    ));
  }

  double getPriceTotal() {
    double total = 0;
    for (final CartModel item in state.selectedProducts.values) {
      total += item.cartResponse.product?.currentPrice != null
          ? item.cartResponse.product!.currentPrice! * item.quantity
          : 0;
    }
    return total;
  }

  @override
  void onInit() {}

  @override
  Future<Result<Failure, PageableData<CartResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result =
        await userCartController.getCarts(size: pageSize, page: page);

    return result.mapResult(
        onLeft: (failure) => failure,
        onRight: (value) {
          final totalPages = value.totalPages ?? 0;
          final data = value.content ?? [];
          final totalItems = value.totalElements ?? 0;

          return PageableData(
            totalPages: totalPages,
            totalItems: totalItems,
            data: data,
          );
        });
  }
}
