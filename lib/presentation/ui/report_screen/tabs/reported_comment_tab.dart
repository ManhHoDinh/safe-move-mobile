// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../presentation/ui/report_screen/widgets/reported_comment_section.dart';
import '../../../../application/services/admin_post_curator/controller/controller.dart';
import '../../../../application/services/admin_post_sgm_news/controller/controller.dart';
import '../../../../application/services/common/dto/src/post_type.dart';
import '../../../../application/services/post_comment/controller/controller.dart';
import '../../../../application/services/post_community/controller/controller.dart';
import '../../../../application/services/post_curator/controller/controller.dart';
import '../../../../application/services/post_sgm_news/controller/controller.dart';
import '../../../../application/services/user_post_reaction/controller/controller.dart';
import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../router/router_config/router_config.dart';
import '../../../router/router_config/routes/profile_branch/profile_branch.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/transitions/transitions.dart';
import '../cubit/reported_post_comment_cubit.dart';

class ReportedCommentTab extends StatelessWidget {
  const ReportedCommentTab({
    super.key,
  });

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const ReportedCommentTab(),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return CustomTransitionBuilder.noTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const postType = PostType.COMMUNITY;
    final currentUserId = context.watch<UserCubit>().state.detail?.id;

    return BlocProvider<ReportedCommentCubit>(
      create: (BuildContext context) {
        return ReportedCommentCubit(
          controller: context.read<PostCommentController>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          loadingManager: context.read<LoadingManager>(),
          postSgmNewsController: context.read<PostSgmNewsController>(),
          postCuratorController: context.read<PostCuratorController>(),
          postCommunityController: context.read<PostCommunityController>(),
          postType: postType,
        );
      },
      child: Builder(
        builder: (context) {
          return PopScope(
            child: RefreshIndicator(
              notificationPredicate: (notification) {
                return notification.depth == 1;
              },
              onRefresh: () async {
                context.read<ReportedCommentCubit>().reload();
              },
              child: Column(
                children: [
                  Expanded(
                    child: ReportedCommentSection(
                      authorId: currentUserId,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
