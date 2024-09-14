import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/category/category.dart';
import '../../../application/services/post_community/controller/controller.dart';
import '../../bases/auth_cubit/auth_cubit.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_search_bar/app_search_bar.dart';
import '../../shared/widgets/expanded_floating_action_button.dart';
import 'blocs/community_cubit.dart';
import 'widgets/community_content.dart';
import 'widgets/community_filter.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({
    super.key,
    this.preSelectedChildId,
    this.preSelectedParentId,
  });

  final int? preSelectedParentId;
  final int? preSelectedChildId;

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const CommunityScreen(),
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
      lazy: false,
      create: (BuildContext context) {
        return CommunityPostCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          postCommunityController: context.read<PostCommunityController>(),
          categoryController: context.read<CategoryController>(),
          loadingManager: context.read<LoadingManager>(),
          preSelectedChildId: preSelectedChildId,
          preSelectedParentId: preSelectedParentId,
        );
      },
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppSearchBar(
            title: Text(S.of(context).community),
            onQuery: (value) {
              context.read<CommunityPostCubit>().search(value);
            },
          ),
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
          floatingActionButton: BlocBuilder<AuthCubit, AuthStatusState>(
              builder: (context, state) {
            if (state is AuthStatusLoggedOutState) {
              return const SizedBox();
            } else {
              return ExpandedFloatingActionButton(
                heroTag: 'main-community',
                onPressed: () async {
                  final postCreated = await const CreatePostRouteData(
                          categoryType: CategoryType.community)
                      .push<bool>(context);
                  if (postCreated == null) {
                    return;
                  }
                  if (postCreated && context.mounted) {
                    context.read<CommunityPostCubit>().reload();
                  }
                },
              );
            }
          }),
        );
      }),
    );
  }
}
