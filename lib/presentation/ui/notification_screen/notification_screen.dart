import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/user/user.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/item_divider.dart';
import '../../utilities/category_name_resolver.dart';
import '../community_screen/widgets/post_loading_error.dart';
import 'blocs/notification_cubit.dart';
import 'blocs/notification_state.dart';
import 'widgets/notification_item.dart';
import 'widgets/shimmer_follow_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with AutomaticKeepAliveClientMixin {
  String renderNotificationType(NotificationType notificationType) {
    switch (notificationType) {
      case NotificationType.commentMyPost:
        return '논평';
      case NotificationType.followingUploadPost:
        return '새 글';
      case NotificationType.reactMyPost:
        return '반작용';
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InfiniteLoaderWrapper<NotificationCubit, NotificationState>(
        create: (BuildContext context) {
      return NotificationCubit(
        initialState: const NotificationState(),
        failureHandlerManager: context.read<FailureHandlerManager>(),
        userController: context.read<UserController>(),
        loadingManager: context.read<LoadingManager>(),
      );
    }, builder: (BuildContext context, ScrollController controller,
            NotificationState state) {
      return Scaffold(
        appBar: CommonAppBar(
          centerTitle: true,
          title: Text(S.of(context).notification),
        ),
        body: Builder(
          builder: (context) {
            final helper = InfiniteLoaderCalculatorHelper(state);
            if (helper.firstLoadInProgress) {
              return const NotificationShimmerContent();
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationCubit>().reload();
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (helper.firstLoadError) {
                    return helper.fullPageScrollable(
                      context,
                      constraints,
                      builder: (context) {
                        return const PostLoadingError();
                      },
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (context, index) {
                      final data = state.data[index];
                      return NotificationItem(
                        onTap: () {
                          if (data.isRead != null && !data.isRead!) {
                            context
                                .read<NotificationCubit>()
                                .readNotification(data.id ?? 0, index);
                          }

                          if (data.url != null) {
                            context.push(data.url ?? '');
                            return;
                          }
                        },
                        notificationType: renderNotificationType(
                            data.type ?? NotificationType.reactMyPost),
                        notificationContent:
                            resolveNotificationTitle(context, data),
                        date: data.createdAt,
                        haveRead: data.isRead ?? false,
                      );
                    },
                    itemCount: helper.length,
                    separatorBuilder: (context, index) {
                      return ItemDivider(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        color: AppColors.gray.shade100,
                        thickness: 1,
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
