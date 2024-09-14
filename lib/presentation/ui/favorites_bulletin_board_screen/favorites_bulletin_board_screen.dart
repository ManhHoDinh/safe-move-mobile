import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/user/user.dart';
import '../../../application/services/user_favorite_category/controller/controller.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../utilities/category_name_resolver.dart';
import 'blocs/favorite_category_cubit.dart';
import 'widgets/favorite_item.dart';

class FavoritesBulletinBoardScreen extends StatefulWidget {
  const FavoritesBulletinBoardScreen({super.key});

  @override
  State<FavoritesBulletinBoardScreen> createState() =>
      _FavoritesBulletinBoardScreenState();
}

class _FavoritesBulletinBoardScreenState
    extends State<FavoritesBulletinBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          S.of(context).favoriteBoard,
          style: Styles.s15()
              .withWeight(FontWeight.w600)
              .withLetterSpacing(-2.5 / 100),
        ),
        centerTitle: true,
      ),
      body: BlocProvider<FavoriteCategoryCubit>(
        create: (BuildContext context) {
          return FavoriteCategoryCubit(
            userController: context.read<UserController>(),
            loadingManager: context.read<LoadingManager>(),
            failureHandlerManager: context.read<FailureHandlerManager>(),
            favoriteCategoryController:
                context.read<UserFavoriteCategoryController>(),
          );
        },
        child: BlocBuilder<FavoriteCategoryCubit, FavoriteCategoryState>(
            builder: (context, state) {
          if (state.apiStatus == ApiStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<FavoriteCategoryCubit>().reload();
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                final data = state.favorited[index];
                return FavoriteItem(
                  title: resolveCategoryName(context, data) ?? '',
                  onTapUnFavorite: () {
                    context
                        .read<FavoriteCategoryCubit>()
                        .unFavorCategory(index);
                  },
                  onTapItem: () {
                    CommunityRouteData(preSelectedParentId: data.id ?? 0)
                        .go(context);
                  },
                );
              },
              itemCount: state.favorited.length,
            ),
          );
        }),
      ),
    );
  }
}
