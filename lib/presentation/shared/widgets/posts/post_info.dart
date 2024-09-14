import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/user.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../base_infinite_loading/image_loading.dart';
import '../../theme/src/app_style.dart';
import '../app_icon_button.dart';
import '../drop_down_bar/drop_down_bar.dart';
import 'post_stats_info.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    super.key,
    required this.title,
    this.imagePath,
    required this.role,
    required this.trailing,
    this.onTap,
    this.isNetworkImage = false,
    this.loading = false,
    this.showDot = true,
    this.writer,
    this.onAction,
  });

  final String? imagePath;
  final String title;
  final String role;
  final String trailing;
  final VoidCallback? onTap;
  final bool loading;
  final bool isNetworkImage;
  final bool showDot;
  final UserDTO? writer;
  final ValueChanged<PostAction>? onAction;

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 164,
      height: 104,
    );
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 164 / 104,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: loading ? AppColors.black : null,
                ),
                child: imagePath == null
                    ? null
                    : FittedBox(
                        fit: BoxFit.cover,
                        child: isNetworkImage
                            ? Image.network(
                                imagePath!,
                                loadingBuilder: helperImage.loadingBuilder,
                                errorBuilder: helperImage.errorBuilder,
                              )
                            : Image.asset(imagePath!),
                      ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (loading)
                              Container(
                                height: 20 * 2,
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              )
                            else
                              Text(
                                title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.s15()
                                    .withWeight(FontWeight.w500)
                                    .withLetterSpacing(-2.5 / 100)
                                    .withColor(AppColors.text.main),
                              ),
                            const SizedBox(
                              height: 4,
                            ),
                            if (loading)
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              )
                            else
                              Text(
                                role,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.s13()
                                    .withLetterSpacing(-2.5 / 100)
                                    .withColor(AppColors.text.common),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (loading)
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            trailing,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Styles.s12().withColor(AppColors.text.bodyText),
                          ),
                        ),
                        Builder(builder: (context) {
                          final userState = context.watch<UserCubit>().state;
                          return showDot &&
                                  !loading &&
                                  (userState.detail?.id == writer?.id ||
                                      userState.detail?.role == Role.system)
                              ? AppIconButton(
                                  icon: Assets.svgs.dotsHorizontalIcon24.svg(),
                                  onTap: loading ||
                                          (userState.detail?.id != writer?.id)
                                      ? null
                                      : () async {
                                          final returnData =
                                              await DropdownSheetRouteData(
                                            $extra: [
                                              if (userState.detail?.id ==
                                                  writer?.id)
                                                DropDownBarData(
                                                  value: PostAction.edit,
                                                  title: S.of(context).edit,
                                                  textStyle: Styles.s13(),
                                                ),
                                              if (userState.detail?.id ==
                                                      writer?.id ||
                                                  userState.detail?.role ==
                                                      Role.system)
                                                DropDownBarData(
                                                  value: PostAction.delete,
                                                  title: S.of(context).delete,
                                                  textStyle: Styles.s13()
                                                      .withColor(AppColors.red),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
