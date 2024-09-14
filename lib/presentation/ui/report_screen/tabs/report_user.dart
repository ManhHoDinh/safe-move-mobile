import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/user/controller/controller.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/transitions/transitions.dart';
import '../../profile_details_screen/blocs/profile_details_cubit.dart';
import '../cubit/reported_user_cubit.dart';
import '../widgets/reported_user_section.dart';

class ReportedUserTab extends StatelessWidget {
  const ReportedUserTab({super.key});
  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const ReportedUserTab(),
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
    return BlocProvider<ReportedUserCubit>(
      create: (BuildContext context) {
        return ReportedUserCubit(
            failureHandlerManager: context.read<FailureHandlerManager>(),
            loadingManager: context.read<LoadingManager>(),
            userController: context.read<UserController>());
      },
      child: Builder(
        builder: (context) {
          return PopScope(
            child: RefreshIndicator(
              notificationPredicate: (notification) {
                return notification.depth == 1;
              },
              onRefresh: () async {
                context.read<ReportedUserCubit>().reload();
              },
              child: Column(
                children: [
                  Expanded(
                    child: ReportedUserSection(
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
