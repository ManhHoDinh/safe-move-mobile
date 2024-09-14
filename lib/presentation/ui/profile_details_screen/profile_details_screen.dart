import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/bases/user_cubit/user_cubit.dart';
import '../../../presentation/shared/widgets/drop_down_bar/drop_down_bar.dart';

import '../../../application/services/common/common.dart';
import '../../../application/services/common/dto/src/post_activity_type.dart';
import '../../../application/services/user/controller/controller.dart';
import '../../../application/services/user_follow/controller/controller.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../utilities/share_link.dart';
import 'blocs/profile_details_cubit.dart';
import 'widgets/associated_post_by_user_id_tab.dart';
import 'widgets/profile_tab_bar.dart';
import 'widgets/user_infor_section.dart';

enum ProfileAction { edit, delete, report }

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDetailsCubit>(
      create: (BuildContext context) {
        return ProfileDetailsCubit(
          userController: context.read<UserController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          userId: userId,
          userFollowController: context.read<UserFollowController>(),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(
          actions: [
            Builder(builder: (context) {
              final profileState = context.watch<ProfileDetailsCubit>().state;
              return AppIconButton(
                icon: Assets.svgs.uploadIcon.svg(),
                onTap: () async {
                  final String appLink =
                      ProfileDetailsRouteData(userId: userId).location;
                  final result = await shareLink(
                      appLink, context, profileState.userDetail?.name ?? '');
                  if (result != null && result && context.mounted) {
                    final AppSnackBar snackBar =
                        AppSnackBar(title: S.of(context).shareSuccessfully);
                    snackBar.showSnackBar(context);
                  }
                },
              );
            }),
            Builder(builder: (context) {
              final currentUserId = context.watch<UserCubit>().state.detail?.id;

              if (currentUserId == userId) {
                return Container();
              }

              return AppIconButton(
                icon: Assets.svgs.dotsHorizontalIcon.svg(),
                onTap: () async {
                  final returnData = await DropdownSheetRouteData(
                    $extra: [
                      DropDownBarData(
                        value: ProfileAction.report,
                        title: S.of(context).report,
                        textStyle: Styles.s13().withColor(AppColors.red),
                      ),
                    ],
                  ).push<ProfileAction>(context);
                  if (returnData == null || !context.mounted) {
                    return;
                  }
                  if (returnData == ProfileAction.report) {
                    final agreed = await ConfirmRouteData(
                            content: S.of(context).areYouSureToReportThisUser)
                        .push<bool>(context);

                    if (agreed == null) {
                      return;
                    }
                    if (agreed == true && context.mounted) {
                      context.read<ProfileDetailsCubit>().reportUser();
                    }
                  }
                },
              );
            }),
          ],
        ),
        body: BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
            builder: (context, state) {
          if (state.apiStatus == ApiStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.apiStatus == ApiStatus.fail) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  S.of(context).someThingWentWrong,
                ),
              ),
            );
          }
          return DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: UserInfoSection(
                      imageUrl: state.userDetail?.avatarUrl,
                      name: state.userDetail?.name ?? '',
                      description: state.userDetail?.bio,
                      onFollowToggle: () {
                        context.read<ProfileDetailsCubit>().followToggle();
                      },
                      following: state.hasFollow,
                      userId: userId,
                    ),
                  ),
                  const ProfileTabBar(),
                ];
              },
              body: TabBarView(
                children: [
                  AssociatedPostByUserIdTab(
                    initialPostActivityType: PostActivityType.POSTED,
                    initialPostType: PostType.COMMUNITY,
                    userId: userId,
                  ),
                  AssociatedPostByUserIdTab(
                    initialPostActivityType: PostActivityType.COMMENTED,
                    initialPostType: PostType.COMMUNITY,
                    userId: userId,
                  ),
                  AssociatedPostByUserIdTab(
                    initialPostActivityType: PostActivityType.LIKED,
                    initialPostType: PostType.COMMUNITY,
                    userId: userId,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
