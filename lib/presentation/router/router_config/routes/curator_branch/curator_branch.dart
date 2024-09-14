import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/services/common/common.dart';
import '../../../../ui/curator_screen/curator_screen.dart';
import '../../../../ui/post_details_screen/post_details_screen.dart';
import '../../../app_nav_key/app_nav_key.dart';

class CuratorBranchData extends StatefulShellBranchData {
  const CuratorBranchData();
}

class CuratorRouteData extends GoRouteData {
  const CuratorRouteData({
    this.preSelectedParentId,
    this.preSelectedChildId,
  });

  final int? preSelectedParentId;
  final int? preSelectedChildId;

  static const routeName = '/curator';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CuratorScreen(
      preSelectedParentId: preSelectedParentId,
      preSelectedChildId: preSelectedChildId,
    );
  }
}

class CuratorPostDetailRouteData extends GoRouteData {
  const CuratorPostDetailRouteData({
    required this.postId,
  });

  final int postId;

  static const routeName = 'detail/:postId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsScreen(
      postId: postId,
      postType: PostType.CURATOR,
    );
  }
}
