import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/category/category.dart';
import '../../../application/services/user/user.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/auth_cubit/auth_cubit.dart';
import '../../bases/user_cubit/user_cubit.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_search_bar/app_search_bar.dart';
import '../../shared/widgets/expanded_floating_action_button.dart';
import '../../shared/widgets/tab_bar.dart';
import '../../utilities/category_name_resolver.dart';
import '../community_screen/widgets/post_loading_error.dart';
import 'blocs/curator_category_cubit.dart';
import 'blocs/search_trigger_cubit.dart';
import 'widgets/curator_tab.dart';
import 'widgets/shimmer_curator_component.dart';

class CuratorScreen extends StatelessWidget {
  const CuratorScreen({
    super.key,
    this.preSelectedParentId,
    this.preSelectedChildId,
  });

  final int? preSelectedParentId;
  final int? preSelectedChildId;

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const CuratorScreen(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchTriggerCubit>(
          lazy: false,
          create: (context) => SearchTriggerCubit(),
        ),
        BlocProvider<CuratorCategoryCubit>(
          lazy: false,
          create: (context) {
            return CuratorCategoryCubit(
              categoryController: context.read<CategoryController>(),
              failureHandlerManager: context.read<FailureHandlerManager>(),
            );
          },
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppSearchBar(
            title: Text(S.of(context).curator),
            onQuery: (value) {
              context.read<SearchTriggerCubit>().query(value);
            },
          ),
          body: Builder(builder: (context) {
            final categoryState = context.watch<CuratorCategoryCubit>().state;
            if (categoryState.apiStatus == ApiStatus.loading) {
              return const ShimmerCuratorContent();
            }
            if (categoryState.apiStatus == ApiStatus.fail) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<CuratorCategoryCubit>().reload();
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: const PostLoadingError(),
                      ),
                    );
                  },
                ),
              );
            }

            return DefaultTabController(
              length: categoryState.categories.length,
              child: _InitialTabNavigator(
                preSelectedId: preSelectedParentId,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTabBar(
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      tabs: categoryState.categories
                          .map((e) => PaddedTab(
                              text: resolveCategoryName(context, e) ?? ''))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: categoryState.categories.map(
                          (e) {
                            return CuratorTab(
                              parentCategory: e,
                              preSelectedChildCategory: preSelectedChildId,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          floatingActionButton: Builder(builder: (context) {
            final authState = context.watch<AuthCubit>().state;
            final userState = context.watch<UserCubit>().state;
            if (authState is AuthStatusLoggedOutState) {
              return const SizedBox();
            }

            if (userState.apiStatus != ApiStatus.success) {
              return const SizedBox();
            }

            if (!(userState.detail?.role == Role.admin ||
                userState.detail?.role == Role.system)) {
              return const SizedBox();
            }

            return ExpandedFloatingActionButton(
              heroTag: 'main-curator',
              onPressed: () async {
                final postCreated = await const CreatePostRouteData(
                        categoryType: CategoryType.curator)
                    .push<bool>(context);
                if (postCreated == null) {
                  return;
                }
                if (postCreated && context.mounted) {
                  context.read<CuratorCategoryCubit>().reload();
                }
              },
            );
          }),
        );
      }),
    );
  }
}

class _InitialTabNavigator extends StatefulWidget {
  const _InitialTabNavigator({
    required this.child,
    this.preSelectedId,
  });

  final Widget child;
  final int? preSelectedId;

  @override
  State<_InitialTabNavigator> createState() => _InitialTabNavigatorState();
}

class _InitialTabNavigatorState extends State<_InitialTabNavigator> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) {
      return;
    }
    _initialized = true;
    if (widget.preSelectedId == null) {
      return;
    }
    final currentCategories =
        context.read<CuratorCategoryCubit>().state.categories;
    final selectedIndex = currentCategories
        .indexWhere((element) => element.id == widget.preSelectedId);
    if (selectedIndex == -1) {
      return;
    }

    final tabController = DefaultTabController.of(context);
    tabController.animateTo(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
