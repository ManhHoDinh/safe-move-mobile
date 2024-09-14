import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/file/file.dart';
import '../../../application/services/product/product.dart';
import '../../bases/cart_cubit/cart_cubit.dart';
import '../../gen/app_colors.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/widgets/add_to_cart/add_to_cart_animation.dart';
import '../../shared/widgets/cart_sheet/cart_sheet.dart';
import '../../shared/widgets/item_divider.dart';
import '../../utilities/calculate_discount.dart';
import '../../utilities/category_name_resolver.dart';
import '../../utilities/request_login.dart';
import 'blocs/product_detail_cubit.dart';
import 'blocs/product_detail_state.dart';
import 'widgets/carousel_app_bar.dart';
import 'widgets/product_action_section.dart';
import 'widgets/product_information_section.dart';
import 'widgets/product_information_tab.dart';
import 'widgets/product_tab_bar.dart';
import 'widgets/qa_tab.dart';
import 'widgets/reviews_tab.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: cartKey,
      height: 20,
      width: 20,
      opacity: 0.5,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      createAddToCartAnimation: (runAddToCartAnimation) {
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: BlocProvider<ProductDetailCubit>(
        lazy: false,
        create: (context) {
          return ProductDetailCubit(
            productController: context.read<ProductController>(),
            failureHandlerManager: context.read<FailureHandlerManager>(),
            id: widget.productId,
          );
        },
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
          final ProductResponse productData = state.productResponse;
          final List<String> items = [];
          for (final FileResponse image in productData.images ?? []) {
            if (image.previewUrl != null) {
              items.add(image.previewUrl!);
            }
          }
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: AppColors.gray.shade70,
              body: state.loading
                  ? AppShimmer(child: _loadingShimmer())
                  : Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            notificationPredicate: (notification) {
                              return notification.depth == 2;
                            },
                            onRefresh: () async {
                              context.read<ProductDetailCubit>().reload();
                            },
                            child: NestedScrollView(
                              headerSliverBuilder: (BuildContext context,
                                  bool innerBoxIsScrolled) {
                                return [
                                  CarouselAppBar(
                                    cartKey: cartKey,
                                  ),
                                  SliverToBoxAdapter(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        ProductInformation(
                                          rating: productData.ratingPoint ?? 0,
                                          name: resolveFieldValueName(
                                                  context, productData.title) ??
                                              '',
                                          oldPrice:
                                              productData.originalPrice ?? 0,
                                          currentPrice:
                                              productData.currentPrice ?? 0,
                                          discount: calculateDiscount(
                                              productData.currentPrice,
                                              productData.originalPrice),
                                        ),
                                        const ItemDivider(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const ProductTabBar(),
                                ];
                              },
                              body: TabBarView(
                                children: [
                                  const ProductInformationTab(),
                                  ReviewsTab(
                                    productId: widget.productId,
                                  ),
                                  QATab(productId: widget.productId),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ProductActionSection(
                          onPressPurchase: () async {
                            final isLoggedIn =
                                await requestLoginAction(context);
                            if (isLoggedIn) {
                              if (!context.mounted) {
                                return;
                              }

                              await CartSheetRouteData(
                                      $extra: CartSheetItem(
                                        imageUrl:
                                            items.isNotEmpty ? items[0] : null,
                                        title: resolveFieldValueName(
                                                context, productData.title) ??
                                            '',
                                        pricePerUnit:
                                            productData.currentPrice ?? 0,
                                        actionType:
                                            ProductActionType.orderSession,
                                      ),
                                      productId: widget.productId)
                                  .push(context);
                            }
                          },
                          onPressShoppingCart: () async {
                            final isLoggedIn =
                                await requestLoginAction(context);
                            if (isLoggedIn) {
                              if (!context.mounted) {
                                return;
                              }

                              final GlobalKey<State<StatefulWidget>>?
                                  globalKey = await CartSheetRouteData(
                                          $extra: CartSheetItem(
                                            actionType:
                                                ProductActionType.addToCart,
                                            imageUrl: items.isNotEmpty
                                                ? items[0]
                                                : null,
                                            title: resolveFieldValueName(
                                                    context,
                                                    productData.title) ??
                                                '',
                                            pricePerUnit:
                                                productData.currentPrice ?? 0,
                                          ),
                                          productId: widget.productId)
                                      .push<GlobalKey<State<StatefulWidget>>>(
                                          context);

                              if (!context.mounted) {
                                return;
                              }
                              if (globalKey != null) {
                                await runAddToCartAnimation(globalKey);
                                await cartKey.currentState!.runCartAnimation();
                                if (!context.mounted) {
                                  return;
                                }
                                context.read<CartCubit>().reload();
                              }
                            }
                          },
                        ),
                      ],
                    ),
            ),
          );
        }),
      ),
    );
  }

  Widget _loadingShimmer() {
    return Column(
      children: [
        Container(
          height: 375,
          color: AppColors.black,
        ),
        const SizedBox(
          height: 16,
        ),
        const ProductInformation(
          rating: 4.5,
          name: '아임 약콩 두유 190ml x 60포아임 약콩 두유 190ml x 60포아임 약콩 두유 190ml x 60포',
          oldPrice: 90000,
          currentPrice: 90000,
          loading: true,
          discount: 40,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.black,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
