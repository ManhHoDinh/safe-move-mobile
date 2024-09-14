import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/empty.dart';
import '../../../utilities/calculate_discount.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/store_cubit.dart';
import 'product_item.dart';

class ProductsLayout extends StatelessWidget {
  const ProductsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const shimmerItem = AppShimmer(
      child: ProductItem(
        loading: true,
        title: '아임 약콩 두유 190ml x 60포',
        price: 90000,
        originalPrice: 90000,
        discount: 40,
        rating: 4,
        numberOfReviews: 200,
      ),
    );

    return InfiniteLoaderWrapper<StoreCubit, StoreState>.value(
        value: context.read<StoreCubit>(),
        builder: (BuildContext context, ScrollController controller,
            StoreState state) {
          final helper =
              InfiniteLoaderCalculatorHelper(state, loadingOffset: 2);
          if (helper.firstLoadInProgress) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(top: 24, bottom: 50),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 163 / 255,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 32,
                  crossAxisCount: 2,
                ),
                controller: controller,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return shimmerItem;
                });
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<StoreCubit>().reload();
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (helper.firstLoadError) {
                  return helper.fullPageScrollable(context, constraints,
                      builder: (context) {
                    return TextCenter(title: S.of(context).someError);
                  });
                }
                if (helper.emptyResult) {
                  return helper.fullPageScrollable(context, constraints,
                      builder: (context) {
                    return TextCenter(
                      title: S.of(context).emptyList,
                    );
                  });
                }
                return GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18)
                        .copyWith(bottom: 20),
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 163 / 265,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 32,
                      crossAxisCount: 2,
                    ),
                    controller: controller,
                    itemCount: helper.length,
                    itemBuilder: (BuildContext context, int index) {
                      return helper.renderItem(context, index,
                          loadingItemBuilder: (context) => shimmerItem,
                          itemBuilder: (context) {
                            final dataProduct = state.data[index];
                            return ProductItem(
                              imagePath: dataProduct.images != null &&
                                      dataProduct.images!.isNotEmpty
                                  ? dataProduct.images![0].previewUrl
                                  : null,
                              title: resolveFieldValueName(
                                      context, dataProduct.title) ??
                                  '',
                              price: dataProduct.currentPrice ?? 0,
                              originalPrice: dataProduct.originalPrice ?? 0,
                              discount: calculateDiscount(
                                  dataProduct.currentPrice,
                                  dataProduct.originalPrice),
                              rating: dataProduct.ratingPoint ?? 0,
                              numberOfReviews: dataProduct.totalUserRating ?? 0,
                              onTap: () {
                                if (dataProduct.id == null) {
                                  return;
                                }
                                ProductDetailsRouteData(
                                        productId: dataProduct.id!)
                                    .push(context);
                              },
                            );
                          });
                    });
              },
            ),
          );
        });
  }
}
