import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/filters/head_filter.dart';
import '../../../shared/widgets/item_divider.dart';
import '../../../utilities/category_name_resolver.dart';
import '../../community_screen/widgets/community_filter_sheet.dart';
import '../blocs/create_post_cubit.dart';
import '../blocs/create_post_state.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
          return HeadFilter(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            spacer: const Spacer(),
            style: Styles.s15()
                .withLetterSpacing(-2.5 / 100)
                .withHeight(24 / 15)
                .withColor(AppColors.text.common),
            value: resolveCategoryName(context, state.parentCategory) ??
                S.of(context).pleaseChooseCategory,
            onTap: () async {
              final List<CommunityCategoryItem> categories = [];
              categories.addAll(
                (state.postCategories ?? []).map(
                  (e) => CommunityCategoryItem(
                    shouldShowFavoriteIcon: false,
                    label: resolveCategoryName(context, e) ?? '',
                    id: e.id,
                  ),
                ),
              );
              final result =
                  await CommunityCategoriesRouteData($extra: categories)
                      .push<CommunityCategoryItem>(context);
              if (result == null) {
                return;
              }
              if (!context.mounted) {
                return;
              }
              context.read<CreatePostCubit>().changeParentCategory(
                    state.postCategories
                        ?.where((element) => element.id == result.id)
                        .firstOrNull,
                  );
            },
          );
        }),
        const ItemDivider(
          thickness: 1,
          padding: EdgeInsets.zero,
        ),
        BlocBuilder<CreatePostCubit, CreatePostState>(
            builder: (context, state) {
          return HeadFilter(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            spacer: const Spacer(),
            style: Styles.s15()
                .withLetterSpacing(-2.5 / 100)
                .withHeight(24 / 15)
                .withColor(AppColors.text.common),
            value: resolveSubCategoryName(context, state.childCategory) ??
                S.of(context).pleaseSelectSubCategory,
            onTap: () async {
              final List<CommunityCategoryItem> categories = [];
              categories.addAll(
                (state.parentCategory!.children ?? []).map(
                  (e) => CommunityCategoryItem(
                    shouldShowFavoriteIcon: false,
                    label: resolveSubCategoryName(context, e) ?? '',
                    id: e.id,
                  ),
                ),
              );
              final result =
                  await CommunityCategoriesRouteData($extra: categories)
                      .push<CommunityCategoryItem>(context);
              if (result == null) {
                return;
              }
              if (!context.mounted) {
                return;
              }
              context.read<CreatePostCubit>().changeChildCategory(
                    state.parentCategory?.children
                        ?.where((element) => element.id == result.id)
                        .firstOrNull,
                  );
            },
          );
        }),
        const ItemDivider(
          thickness: 1,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
