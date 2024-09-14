import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/cart_sheet/cart_sheet.dart';
import '../../../../ui/cart_screen/cart_screen.dart';
import '../../../../ui/compose_qa_screen/compose_qa_screen.dart';
import '../../../../ui/compose_review_screen/compose_review_screen.dart';
import '../../../../ui/order_detail_screen/new_order_details_screen.dart';
import '../../../../ui/payment_status_screen/payment_success_screen.dart';
import '../../../../ui/product_details_screen/product_details_screen.dart';
import '../../../../ui/store_screen/store_screen.dart';
import '../../../../ui/store_screen/widgets/product_category_filter_sheet.dart';
import '../../../app_nav_key/app_nav_key.dart';

class StoreBranchData extends StatefulShellBranchData {
  const StoreBranchData();
}

class StoreRouteData extends GoRouteData {
  const StoreRouteData();

  static const routeName = '/store';
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StoreScreen();
  }
}

class ProductCategoriesRouteData extends GoRouteData {
  const ProductCategoriesRouteData({
    required this.$extra,
  });

  static const routeName = 'categories';
  final List<ProductCategoryItem> $extra;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ProductFilterSheet.buildPage(
      context,
      key: state.pageKey,
      items: $extra,
    );
  }
}

class ProductDetailsRouteData extends GoRouteData {
  const ProductDetailsRouteData({
    required this.productId,
  });

  final int productId;

  static const routeName = ':productId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductDetailScreen(productId: productId);
  }
}

class CartSheetRouteData extends GoRouteData {
  const CartSheetRouteData({
    required this.productId,
    required this.$extra,
  });

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;
  final CartSheetItem $extra;

  final int productId;
  static const routeName = 'cart-sheet';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CartSheet.buildPage(
      context,
      key: state.pageKey,
      item: $extra,
      productId: productId,
    );
  }
}

class ComposeReviewRouteData extends GoRouteData {
  const ComposeReviewRouteData({
    required this.productId,
  });

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  final int productId;
  static const routeName = 'review';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ComposeReviewScreen(
      productId: productId,
    );
  }
}

class ComposeQARouteData extends GoRouteData {
  const ComposeQARouteData({
    required this.productId,
  });

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  final int productId;
  static const routeName = 'qa';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ComposeQAScreen(
      productId: productId,
    );
  }
}

class CartRouteData extends GoRouteData {
  const CartRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  static const routeName = 'cart';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CartScreen();
  }
}

class NewOrderDetailsRouteData extends GoRouteData {
  const NewOrderDetailsRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  static const routeName = 'new-order';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NewOrderDetailsScreen();
  }
}

class PaymentSuccessRouteData extends GoRouteData {
  const PaymentSuccessRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  static const routeName = 'payment-success';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PaymentSuccessScreen(
      success: true,
    );
  }
}

class PaymentFailedRouteData extends GoRouteData {
  const PaymentFailedRouteData();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  static const routeName = 'payment-failed';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PaymentSuccessScreen(
      success: false,
    );
  }
}
