import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/router_config/router_config.dart';
import '../../router/router_config/routes/news_branch/news_branch.dart';
import '../../shared/transitions/transitions.dart';
import 'main_pop_scope.dart';
import 'widgets/main_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.navigator,
  });

  final Widget navigator;

  static Page<void> buildPage(
      BuildContext context, GoRouterState state, Widget navigator) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: MainScreen(
        navigator: navigator,
      ),
      transitionDuration: const Duration(milliseconds: 850),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return CustomTransitionBuilder.slideFromRightTransition(
            context,
            animation,
            secondaryAnimation,
            CustomTransitionBuilder.backgroundFadeTransition(
              context,
              animation,
              secondaryAnimation,
              child,
            ));
      },
    );
  }

  void onChangeTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        const HomeRouteData().go(context);
        break;
      case 1:
        const CommunityRouteData().go(context);
        break;
      case 2:
        const CuratorRouteData().go(context);
        break;
      case 3:
        const NewsRouteData().go(context);
        break;
      case 4:
        const StoreRouteData().go(context);
        break;
      case 5:
        const ProfileRouteData().go(context);
        break;
    }
  }

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(const HomeRouteData().location)) {
      return 0;
    }
    if (location.startsWith(const CommunityRouteData().location)) {
      return 1;
    }
    if (location.startsWith(const CuratorRouteData().location)) {
      return 2;
    }
    if (location.startsWith(const NewsRouteData().location)) {
      return 3;
    }
    if (location.startsWith(const StoreRouteData().location)) {
      return 4;
    }
    if (location.startsWith(const ProfileRouteData().location)) {
      return 5;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return MainPopScope(
      child: Scaffold(
        body: navigator,
        bottomNavigationBar: MainBottomNavigationBar(
          selected: getCurrentIndex(context),
          onSelected: (index) => onChangeTab(context, index),
        ),
      ),
    );
  }
}
