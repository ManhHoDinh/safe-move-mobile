import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../../../utilities/date_format.dart';

enum ItemUserAction { edit, delete, report }

class ItemUser extends StatelessWidget {
  const ItemUser({
    super.key,
    this.imageUrl,
    required this.name,
    this.loading = false,
    required this.availableActions,
    this.onAction,
  });

  final String? imageUrl;
  final String name;
  final bool loading;
  final Set<ItemUserAction> availableActions;
  final ValueChanged<ItemUserAction>? onAction;

  @override
  Widget build(BuildContext context) {
    const helper = ImageLoading(
      width: 36,
      height: 36,
    );
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      duration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gray.shade300,
                ),
                child: imageUrl == null || loading
                    ? null
                    : Image.network(
                        imageUrl!,
                        loadingBuilder: helper.imageLoadingBuilder,
                        errorBuilder: helper.imageErrorBuilder,
                      ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (loading)
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.gray.shade300,
                          ),
                        )
                      else
                        Text(
                          name,
                          style: Styles.s13()
                              .withWeight(FontWeight.w500)
                              .withLetterSpacing(-2.5 / 100)
                              .withColor(AppColors.text.common),
                        ),
                      const SizedBox(width: 6),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              if (availableActions.isNotEmpty)
                AppIconButton(
                  icon: Assets.svgs.dotsHorizontalIcon.svg(),
                  onTap: loading
                      ? null
                      : () async {
                          final returnData = await DropdownSheetRouteData(
                            $extra: [
                              if (availableActions
                                  .contains(ItemUserAction.edit))
                                DropDownBarData(
                                  value: ItemUserAction.edit,
                                  title: S.of(context).edit,
                                  textStyle: Styles.s13(),
                                ),
                              if (availableActions
                                  .contains(ItemUserAction.delete))
                                DropDownBarData(
                                  value: ItemUserAction.delete,
                                  title: S.of(context).delete,
                                  textStyle:
                                      Styles.s13().withColor(AppColors.red),
                                ),
                              if (availableActions
                                  .contains(ItemUserAction.report))
                                DropDownBarData(
                                  value: ItemUserAction.report,
                                  title: S.of(context).report,
                                  textStyle:
                                      Styles.s13().withColor(AppColors.red),
                                ),
                            ],
                          ).push<ItemUserAction>(context);
                          if (returnData == null) {
                            return;
                          }
                          onAction?.call(returnData);
                        },
                )
            ],
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
