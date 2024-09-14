part of 'cart_cubit.dart';

class CartModel {
  CartModel({
    required this.cartResponse,
    required this.quantity,
  });

  int quantity;
  final CartResponse cartResponse;
}

class CartState extends InfiniteLoaderState<CartResponse> {
  CartState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    this.selectedProducts = const {},
    this.productList = const {},
    required this.listKey,
    this.totalItemsShow = 0,
    this.selectedAll = false,
  });

  final Map<int, CartModel> productList;
  final Map<int, CartModel> selectedProducts;
  final GlobalKey<AnimatedListState> listKey;
  final bool selectedAll;
  int totalItemsShow;

  @override
  InfiniteLoaderState<CartResponse> loadingManagementStateChanged({
    List<CartResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    final Map<int, CartModel> cartCurrent = {};
    for (final CartResponse item in data ?? []) {
      if (item.id != null && item.quantity != null) {
        cartCurrent.addEntries({
          MapEntry(
              item.id!,
              CartModel(
                cartResponse: item,
                quantity: item.quantity ?? 0,
              )),
        });
      }
    }
    if (cartCurrent.isNotEmpty) {
      listKey.currentState?.insertAllItems(
          productList.length, cartCurrent.length - productList.length);

      if (selectedAll) {
        final List<CartModel> list = cartCurrent.values.toList();
        for (int i = productList.length - 1; i < list.length; i++) {
          selectedProducts.addEntries({
            MapEntry(list[i].cartResponse.id!, list[i]),
          });
        }
      }
    }

    return CartState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      productList: cartCurrent.isEmpty ? productList : cartCurrent,
      listKey: listKey,
      selectedProducts: selectedProducts,
      selectedAll: selectedAll,
      totalItemsShow: data?.length ?? totalItemsShow,
    );
  }

  CartState copyWith({
    Map<int, CartModel>? productList,
    GlobalKey<AnimatedListState>? listKey,
    Map<int, CartModel>? selectedProducts,
    int? totalItemsShow,
    bool? selectedAll,
  }) {
    return CartState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      totalItems: totalItems,
      productList: productList ?? this.productList,
      listKey: listKey ?? this.listKey,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      totalItemsShow: totalItemsShow ?? this.totalItemsShow,
      selectedAll: selectedAll ?? this.selectedAll,
    );
  }
}
