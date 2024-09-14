import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/file/response/src/file_response.dart';
import '../../../bases/cart_cubit/cart_cubit.dart';
import '../../../utilities/category_name_resolver.dart';
import 'cart_product_item.dart';

class CartItemHandler {
  CartItemHandler({
    required this.state,
    required this.context,
    required this.constraints,
  });
  final CartState state;
  final BuildContext context;
  final BoxConstraints constraints;

  Widget handleCartItems(int index) {
    final int totalItemsRemain =
        state.totalItems - state.data.length + state.totalItemsShow;
    if (index >= state.productList.length) {
      return const SizedBox();
    }
    if (state.totalItemsShow == 0 && totalItemsRemain != 0) {
      context.read<CartCubit>().reload();
      return const SizedBox();
    }

    final data = state.productList.values.toList()[index].cartResponse;
    final imageUrl = _getImageUrl(data.product?.images);
    final quantity = _getQuantity(data.id);

    return CartProductItem(
      selected: state.selectedProducts.containsKey(data.id),
      onSelectionChanged: (value) {
        _handleSelectionChanged(data.id, value);
      },
      imageUrl: imageUrl,
      title: resolveFieldValueName(context, data.product?.title) ?? '',
      pricePerUnit: data.product?.currentPrice ?? 0,
      onDeletePressed: () {
        _handleDeleteCart(data.id, index);
      },
      amount: quantity,
      onAmountChanged: (value) {
        _handleUpdateQuantity(data.id, value);
      },
    );
  }

  String _getImageUrl(List<FileResponse>? images) {
    final List<String> items = [];
    for (final FileResponse image in images ?? []) {
      if (image.previewUrl != null) {
        items.add(image.previewUrl!);
      }
    }
    return items.first;
  }

  int _getQuantity(int? id) {
    return id != null ? state.productList[id]?.quantity ?? 0 : 0;
  }

  void _handleSelectionChanged(int? id, bool value) {
    if (id != null) {
      context.read<CartCubit>().onSelectionChanged(id, value);
    }
  }

  void _handleDeleteCart(int? id, int index) {
    if (id != null) {
      context.read<CartCubit>().onDeleteCart(id, index);
    }
  }

  void _handleUpdateQuantity(int? id, int value) {
    if (id != null) {
      context.read<CartCubit>().onUpdateQuantity(id, value);
    }
  }
}
