import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/filters/head_filter.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/store_cubit.dart';
import 'product_category_filter_sheet.dart';

class StoreFilter extends StatelessWidget {
  const StoreFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadFilter(
              value: resolveCategoryName(context, state.category) ??
                  S.of(context).seeAll,
              onTap: () async {
                final List<ProductCategoryItem> categories = [
                  ProductCategoryItem(
                    label: S.of(context).seeAll,
                  ),
                ];

                categories.addAll((state.productCategories ?? [])
                    .map((e) => ProductCategoryItem(
                          label: resolveCategoryName(context, e) ?? '',
                          id: e.id,
                        )));

                final result =
                    await ProductCategoriesRouteData($extra: categories)
                        .push<ProductCategoryItem>(context);
                if (result == null) {
                  return;
                }
                if (!context.mounted) {
                  return;
                }

                context.read<StoreCubit>().changeCategory(
                      state.productCategories
                          ?.where((element) => element.id == result.id)
                          .firstOrNull,
                    );
              },
            ),
            Text(S.of(context).totalItems(state.totalItems),
                style: Styles.s13()
                    .withHeight(20 / 15)
                    .withLetterSpacing(-25 / 100)
                    .withColor(AppColors.text.bodyText))
          ],
        ),
      );
    });
  }
}
