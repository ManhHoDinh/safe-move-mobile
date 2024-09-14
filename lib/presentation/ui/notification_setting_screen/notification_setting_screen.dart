import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/user/user.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_switches/app_switch.dart';
import 'blocs/notification_settings_cubit.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          S.of(context).notificationSettings,
          style: Styles.s15()
              .withWeight(FontWeight.w600)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.main),
        ),
        centerTitle: true,
      ),
      body: BlocProvider<NotificationSettingsCubit>(
        create: (BuildContext context) {
          return NotificationSettingsCubit(
            failureHandlerManager: context.read<FailureHandlerManager>(),
            userController: context.read<UserController>(),
            loadingManager: context.read<LoadingManager>(),
          );
        },
        child:
            BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
                builder: (context, state) {
          if (state.apiStatus == ApiStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return LayoutBuilder(builder: (context, constraints) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationSettingsCubit>().reload();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: constraints.maxHeight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _ItemSettingNotification(
                        title: S.of(context).followNewPostNotification,
                        value: state.selected
                            .contains(NotificationType.followingUploadPost),
                        onTap: (bool value) {
                          context
                              .read<NotificationSettingsCubit>()
                              .toggle(NotificationType.followingUploadPost);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _ItemSettingNotification(
                        title: S.of(context).commentAlert,
                        value: state.selected
                            .contains(NotificationType.commentMyPost),
                        onTap: (bool value) {
                          context
                              .read<NotificationSettingsCubit>()
                              .toggle(NotificationType.commentMyPost);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _ItemSettingNotification(
                        title: S.of(context).likeAlert,
                        value: state.selected
                            .contains(NotificationType.reactMyPost),
                        onTap: (bool value) {
                          context
                              .read<NotificationSettingsCubit>()
                              .toggle(NotificationType.reactMyPost);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}

class _ItemSettingNotification extends StatelessWidget {
  const _ItemSettingNotification({
    required this.title,
    required this.onTap,
    required this.value,
  });

  final String title;
  final Function(bool value) onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.s15()
                .withHeight(24 / 15)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          ),
          AppSwitch(
              switchValue: value,
              onChanged: (value) {
                onTap(value);
              })
        ],
      ),
    );
  }
}
