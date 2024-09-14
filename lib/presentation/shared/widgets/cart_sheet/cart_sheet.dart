import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model_route_pages/bottom_sheet_page.dart';
import 'widgets/cart_product_item_sheet.dart';

enum ProductActionType {
  addToCart,
  orderSession,
}

class CartSheetItem {
  const CartSheetItem({
    this.imageUrl,
    required this.title,
    required this.pricePerUnit,
    required this.actionType,
  });
  final String? imageUrl;
  final String title;
  final double pricePerUnit;
  final ProductActionType actionType;
}

class CartSheet {
  const CartSheet._();

  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    required CartSheetItem item,
    required int productId,
  }) {
    return BottomSheetPage(
      key: key,
      contentBuilder: (_) {
        return _CartSheet(
          cartItem: item,
          productId: productId,
        );
      },
    );
  }
}

class _CartSheet extends StatelessWidget {
  const _CartSheet({
    required this.cartItem,
    required this.productId,
  });
  final CartSheetItem cartItem;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return CartProductItemSheet(
      imageUrl: cartItem.imageUrl,
      title: cartItem.title,
      pricePerUnit: cartItem.pricePerUnit,
      productId: productId,
      actionType: cartItem.actionType,
    );
  }
}
