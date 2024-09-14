import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/app/app_config/app_config.dart';
import '../../../application/services/category/category.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../router/router_config/routes/news_branch/news_branch.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../utilities/category_name_resolver.dart';
import 'blocs/drawer_cubit.dart';
import 'widgets/drawer_expansion_tile.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const DrawerScreen(),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return CustomTransitionBuilder.slideFromRightTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      },
    );
  }

  void goCurator(BuildContext context) {
    const CuratorRouteData().go(context);
  }

  void goCommunity(BuildContext context) {
    const CommunityRouteData().go(context);
  }

  void goStore(BuildContext context) {
    const StoreRouteData().go(context);
  }

  void goProfile(BuildContext context) {
    const ProfileRouteData().go(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrawerCubit>(
      create: (BuildContext context) {
        return DrawerCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          categoryController: context.read<CategoryController>(),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(
          automaticallyImplyLeading: false,
          title: Text(S.of(context).fullMenu),
          actions: [
            AppIconButton(
              icon: Assets.svgs.appBarCloseIcon.svg(),
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
        body: BlocBuilder<DrawerCubit, DrawerState>(
          builder: (BuildContext context, DrawerState state) {
            if (state.apiStatus == ApiStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerExpansionTitle(
                    initialExpanded: true,
                    enableCollapse: false,
                    onTitleTap: () {
                      const CommunityRouteData().go(context);
                    },
                    title: S.of(context).community,
                    items: state.communityCategory.map((root) {
                      return DrawerExpansionTitle(
                        boldTitle: false,
                        title: resolveCategoryName(context, root) ?? '',
                        onTitleTap: () {
                          CommunityRouteData(preSelectedParentId: root.id ?? 0)
                              .go(context);
                        },
                        items: (root.children ?? []).map((child) {
                          return DrawerExpansionTitle(
                            onTitleTap: () {
                              CommunityRouteData(
                                      preSelectedParentId: root.id ?? 0,
                                      preSelectedChildId: child.id ?? 0)
                                  .go(context);
                            },
                            boldTitle: false,
                            title: resolveSubCategoryName(context, child) ?? '',
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                  DrawerExpansionTitle(
                    initialExpanded: true,
                    enableCollapse: false,
                    onTitleTap: () {
                      const CuratorRouteData().go(context);
                    },
                    title: S.of(context).curator,
                    items: state.curatorCategory.map((root) {
                      return DrawerExpansionTitle(
                        boldTitle: false,
                        title: resolveCategoryName(context, root) ?? '',
                        onTitleTap: () {
                          CuratorRouteData(preSelectedParentId: root.id ?? 0)
                              .go(context);
                        },
                        items: (root.children ?? []).map((child) {
                          return DrawerExpansionTitle(
                            onTitleTap: () {
                              CuratorRouteData(
                                      preSelectedParentId: root.id ?? 0,
                                      preSelectedChildId: child.id ?? 0)
                                  .go(context);
                            },
                            boldTitle: false,
                            title: resolveSubCategoryName(context, child) ?? '',
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                  DrawerExpansionTitle(
                    title: S.of(context).sgmNews,
                    enableCollapse: false,
                    onTitleTap: () {
                      const NewsRouteData().go(context);
                    },
                  ),
                  DrawerExpansionTitle(
                    title: S.of(context).store,
                    enableCollapse: false,
                    onTitleTap: () {
                      const StoreRouteData().go(context);
                    },
                  ),
                  DrawerExpansionTitle(
                    title: S.of(context).profile,
                    enableCollapse: false,
                    onTitleTap: () {
                      const ProfileRouteData().go(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(context.read<AppConfig>().version),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
