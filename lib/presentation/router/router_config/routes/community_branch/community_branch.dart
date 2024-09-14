import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/services/common/common.dart';
import '../../../../ui/community_screen/community_screen.dart';
import '../../../../ui/community_screen/widgets/community_filter_sheet.dart';
import '../../../../ui/create_post_screen/widgets/post_language_sheet.dart';
import '../../../../ui/post_details_screen/post_details_screen.dart';
import '../../../app_nav_key/app_nav_key.dart';

class CommunityBranchData extends StatefulShellBranchData {
  const CommunityBranchData();
}

class CommunityRouteData extends GoRouteData {
  const CommunityRouteData({
    this.preSelectedChildId,
    this.preSelectedParentId,
  });

  static const routeName = '/community';

  // @override
  // Page<void> buildPage(BuildContext context, GoRouterState state) {
  //   return CommunityScreen.buildPage(context, state);
  // }

  final int? preSelectedParentId;
  final int? preSelectedChildId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CommunityScreen(
      preSelectedChildId: preSelectedChildId,
      preSelectedParentId: preSelectedParentId,
    );
  }
}

class CommunityCategoriesRouteData extends GoRouteData {
  const CommunityCategoriesRouteData({
    required this.$extra,
  });

  static const routeName = 'categories';
  final List<CommunityCategoryItem> $extra;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CommunityFilterSheet.buildPage(
      context,
      key: state.pageKey,
      items: $extra,
    );
  }
}

class PostLanguageRouteData extends GoRouteData {
  const PostLanguageRouteData({
    required this.$extra,
  });

  static const routeName = 'languages';
  final List<LanguageItem> $extra;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return PostLanguageSheet.buildPage(
      context,
      key: state.pageKey,
      items: $extra,
    );
  }
}

class CommunityPostDetailRouteData extends GoRouteData {
  const CommunityPostDetailRouteData({
    required this.postId,
  });

  final int postId;

  static const routeName = 'detail/:postId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsScreen(
      postId: postId,
      postType: PostType.COMMUNITY,
    );
  }
}
