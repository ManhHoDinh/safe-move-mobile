import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/services/common/common.dart';
import '../../../../ui/news_screen/news_screen.dart';
import '../../../../ui/post_details_screen/post_details_screen.dart';
import '../../../../ui/youtube_video_details_screen/youtube_video_details_screen.dart';
import '../../../app_nav_key/app_nav_key.dart';

class NewsBranchData extends StatefulShellBranchData {
  const NewsBranchData();
}

class NewsRouteData extends GoRouteData {
  const NewsRouteData();

  static const routeName = '/news';

  // @override
  // Page<void> buildPage(BuildContext context, GoRouterState state) {
  //   return NewsScreen.buildPage(context, state);
  // }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NewsScreen();
  }
}

class NewsPostDetailRouteData extends GoRouteData {
  const NewsPostDetailRouteData({
    required this.postId,
  });

  final int postId;

  static const routeName = 'detail/:postId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsScreen(
      postId: postId,
      postType: PostType.SGM_NEWS,
    );
  }
}

class YoutubePostDetailRouteData extends GoRouteData {
  const YoutubePostDetailRouteData({
    required this.postId,
  });

  final int postId;

  static const routeName = 'youtube/:postId';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = AppNavKey.root;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return YoutubeVideoDetailsScreen(
      postId: postId,
    );
  }
}
