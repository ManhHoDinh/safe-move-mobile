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

enum ItemCommentAction { edit, delete, report }

class ItemComment extends StatelessWidget {
  const ItemComment({
    super.key,
    this.imageUrl,
    required this.name,
    required this.createdAt,
    required this.content,
    required this.isWriter,
    this.isRoot = false,
    this.loading = false,
    this.onReplyPressed,
    required this.availableActions,
    this.onAction,
    this.highLight = false,
  });

  final String? imageUrl;
  final String name;
  final DateTime createdAt;
  final String content;
  final bool isWriter;
  final bool isRoot;
  final bool loading;
  final VoidCallback? onReplyPressed;
  final Set<ItemCommentAction> availableActions;
  final ValueChanged<ItemCommentAction>? onAction;
  final bool highLight;

  @override
  Widget build(BuildContext context) {
    const helper = ImageLoading(
      width: 36,
      height: 36,
    );
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: highLight ? AppColors.blue.shade500.withOpacity(0.1) : null,
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
                      if (isWriter)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.blue.shade100,
                          ),
                          child: Text(
                            S.of(context).writer,
                            style:
                                Styles.s14().withColor(AppColors.blue.shade500),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      if (loading)
                        Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColors.gray.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )
                      else
                        Text(
                          formatDate(createdAt),
                          style: Styles.s13()
                              .withHeight(20 / 13)
                              .withLetterSpacing(-2.5 / 100)
                              .withColor(AppColors.text.caption),
                        ),
                      const SizedBox(
                        width: 4,
                      ),
                      if (isRoot)
                        InkWell(
                          onTap: loading ? null : onReplyPressed,
                          child: Text(S.of(context).writeReply,
                              style: Styles.s13()
                                  .withHeight(20 / 13)
                                  .withLetterSpacing(-2.5 / 100)
                                  .withColor(AppColors.text.bodyText)),
                        )
                    ],
                  )
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
                                  .contains(ItemCommentAction.edit))
                                DropDownBarData(
                                  value: ItemCommentAction.edit,
                                  title: S.of(context).edit,
                                  textStyle: Styles.s13(),
                                ),
                              if (availableActions
                                  .contains(ItemCommentAction.delete))
                                DropDownBarData(
                                  value: ItemCommentAction.delete,
                                  title: S.of(context).delete,
                                  textStyle:
                                      Styles.s13().withColor(AppColors.red),
                                ),
                              if (availableActions
                                  .contains(ItemCommentAction.report))
                                DropDownBarData(
                                  value: ItemCommentAction.report,
                                  title: S.of(context).report,
                                  textStyle:
                                      Styles.s13().withColor(AppColors.red),
                                ),
                            ],
                          ).push<ItemCommentAction>(context);
                          if (returnData == null) {
                            return;
                          }
                          onAction?.call(returnData);
                        },
                )
            ],
          ),
          const SizedBox(height: 7),
          if (loading)
            Container(
              height: 24 * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.gray.shade300,
              ),
            )
          else
            Text(
              content,
              style: Styles.s15()
                  .withHeight(24 / 15)
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.main),
            )
        ],
      ),
    );
  }
}
