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
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_search_bar/app_search_bar.dart';
import '../../shared/widgets/expanded_floating_action_button.dart';
import '../../shared/widgets/tab_bar.dart';
import '../curator_screen/blocs/search_trigger_cubit.dart';
import 'blocs/photo_gallery_cubit.dart';
import 'widgets/photo_gallery_tab.dart';
import 'widgets/youtube_video_tab.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const NewsScreen(),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
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
    return DefaultTabController(
      length: 2,
      child: BlocProvider<SearchTriggerCubit>(
        create: (BuildContext context) {
          return SearchTriggerCubit();
        },
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppSearchBar(
              title: Text(S.of(context).sgmNews),
              onQuery: (value) {
                context.read<SearchTriggerCubit>().query(value);
              },
            ),
            body: const Column(
              children: [
                AppTabBar(
                  isScrollable: false,
                  tabs: [
                    PaddedTab(text: 'Photo Gallery'),
                    PaddedTab(text: 'Youtube Video'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      PhotoGalleryTab(),
                      YoutubeVideoTab(),
                    ],
                  ),
                ),
              ],
            ),
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
                heroTag: 'main-news',
                onPressed: () async {
                  final postCreated = await const CreatePostRouteData(
                          categoryType: CategoryType.sgmNews)
                      .push<bool>(context);
                  if (postCreated == null) {
                    return;
                  }
                  if (postCreated && context.mounted) {
                    context.read<PhotoGalleryCubit>().reload();
                  }
                },
              );
            }),
          );
        }),
      ),
    );
  }
}
