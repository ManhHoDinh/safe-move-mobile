// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/category/controller/controller.dart';
import '../../../../application/services/post_community/controller/controller.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/transitions/transitions.dart';
import '../../community_screen/blocs/community_cubit.dart';
import '../../community_screen/widgets/community_content.dart';
import '../../community_screen/widgets/community_filter.dart';

class ReportedPostTab extends StatelessWidget {
  const ReportedPostTab({
    super.key,
  });
  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const ReportedPostTab(),
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
    return BlocProvider<CommunityPostCubit>(
      create: (BuildContext context) {
        return CommunityPostCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          postCommunityController: context.read<PostCommunityController>(),
          categoryController: context.read<CategoryController>(),
          loadingManager: context.read<LoadingManager>(),
          isReported: true,
        );
      },
      child: Builder(builder: (context) {
        return Scaffold(
          body: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommunityFilter(),
                Expanded(
                  child: CommunityContent(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
