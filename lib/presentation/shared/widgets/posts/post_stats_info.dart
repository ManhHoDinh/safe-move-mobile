import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/dto/dto.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../utilities/date_format.dart';
import '../../base_infinite_loading/image_loading.dart';
import '../drop_down_bar/drop_down_bar.dart';

enum PostAction {
  edit,
  delete,
  report
}

class PostStatsInfo extends StatelessWidget {
  const PostStatsInfo({
    super.key,
    required this.title,
    this.category,
    this.imagePath,
    required this.subTitle,
    required this.author,
    required this.created,
    this.commentCount = 0,
    this.heartCount = 0,
    this.viewCount = 0,
    this.communityName,
    this.onTap,
    this.showDot = true,
    this.loading = false,
    this.writer,
    this.onAction,
  });

  final String? category;
  final String? communityName;
  final String title;
  final String subTitle;
  final String? imagePath;
  final String author;
  final DateTime created; // will change to datetime later

  final int heartCount;
  final int commentCount;
  final int viewCount;
  final VoidCallback? onTap;
  final bool showDot;
  final bool loading;
  final UserDTO? writer;
  final ValueChanged<PostAction>? onAction;

  @override
  Widget build(BuildContext context) {
    final tagStyle = Styles.s13()
        .withColor(AppColors.blue.shade500)
        .withLetterSpacing(-2.5 / 100)
        .withWeight(FontWeight.w500);
    const helperImage = ImageLoading(
      width: 68,
      height: 68,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (communityName == null && category == null)
          const SizedBox.shrink()
        else
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blue.shade100,
                ),
                child: Text(
                  communityName ?? '',
                  style: tagStyle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.blue.shade200),
                  color: loading ? AppColors.black : null,
                ),
                child: Text(
                  category ?? '',
                  style: tagStyle,
                ),
              ),
            ],
          ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: !loading ? onTap : null,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!loading)
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.s18()
                              .withHeight(1)
                              .withWeight(FontWeight.w600)
                              .withLetterSpacing(-2.5 / 100)
                              .withColor(AppColors.text.main),
                        )
                      else
                        Container(
                          width: double.infinity,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      const SizedBox(height: 10),
                      Container(
                        height: 20 * 2,
                        decoration: loading
                            ? BoxDecoration(
                                color: loading ? AppColors.black : null,
                                borderRadius: BorderRadius.circular(4),
                              )
                            : null,
                        child: loading
                            ? null
                            : Text(
                                subTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.s13()
                                    .withLetterSpacing(-2.5 / 100)
                                    .withColor(AppColors.text.common),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (imagePath == null)
              const SizedBox.shrink()
            else
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FittedBox(
                    child: SizedBox.square(
                      dimension: 68,
                      child: Image.network(
                        imagePath!,
                        fit: BoxFit.cover,
                        loadingBuilder: helperImage.loadingBuilder,
                        errorBuilder: helperImage.errorBuilder,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PostStats(
                        count: heartCount,
                        icon: Assets.svgs.heartIcon16.svg(),
                        loading: loading,
                      ),
                      const SizedBox(width: 16),
                      PostStats(
                        count: commentCount,
                        icon: Assets.svgs.commentIcon16.svg(),
                        loading: loading,
                      ),
                      const SizedBox(width: 16),
                      PostStats(
                        count: viewCount,
                        icon: Assets.svgs.eyeIcon16.svg(),
                        loading: loading,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (loading)
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.black,
                          ),
                        )
                      else
                        Text(
                          author,
                          style: Styles.s13()
                              .withWeight(FontWeight.w500)
                              .withColor(AppColors.text.bodyText)
                              .withLetterSpacing(-2.5 / 100),
                        ),
                      const SizedBox(width: 8),
                      if (loading)
                        Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.black,
                          ),
                        )
                      else
                        Text(
                          diffDate(created, context),
                          style: Styles.s13()
                              .withColor(AppColors.text.caption)
                              .withLetterSpacing(-2.5 / 100),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Builder(builder: (context) {
              final userState = context.watch<UserCubit>().state;
              return showDot &&
                      !loading &&
                      (userState.detail?.id == writer?.id ||
                          userState.detail?.role == Role.system ||
                          userState.detail?.role == Role.admin)
                  ? AppIconButton(
                      icon: Assets.svgs.dotsHorizontalIcon24.svg(),
                      onTap: () async {
                        final returnData = await DropdownSheetRouteData(
                          $extra: [
                            if (userState.detail?.id == writer?.id)
                              DropDownBarData(
                                value: PostAction.edit,
                                title: S.of(context).edit,
                                textStyle: Styles.s13(),
                              ),
                            if (userState.detail?.id == writer?.id ||
                                userState.detail?.role == Role.admin ||
                                userState.detail?.role == Role.system)
                              DropDownBarData(
                                value: PostAction.delete,
                                title: S.of(context).delete,
                                textStyle:
                                    Styles.s13().withColor(AppColors.red),
                              ),
                          ],
                        ).push<PostAction>(context);
                        if (returnData == null) {
                          return;
                        }
                        onAction?.call(returnData);
                      },
                    )
                  : const SizedBox.shrink();
            })
          ],
        ),
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  const PostStats({
    super.key,
    required this.count,
    required this.icon,
    required this.loading,
  });

  final Widget icon;
  final int count;
  final bool loading;

  String renderCount(BuildContext context, int count) {
    return count.toString().padLeft(3, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 8),
        if (loading)
          Container(
            width: 40,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.black,
            ),
          )
        else
          Text(
            renderCount(context, count),
            style: Styles.s12().withColor(AppColors.text.common),
          ),
      ],
    );
  }
}
