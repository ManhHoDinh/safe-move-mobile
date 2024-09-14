import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/user_favorite_category/controller/controller.dart';
import '../../../../application/services/user_favorite_category/request/request.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../shared/widgets/app_list_tile.dart';
import '../../../shared/widgets/model_route_pages/bottom_sheet_page.dart';
import '../../../utilities/request_login.dart';

class CommunityCategoryItem {
  const CommunityCategoryItem({
    this.id,
    this.favorite,
    required this.label,
    this.shouldShowFavoriteIcon = true,
  });

  final int? id;
  final String label;
  final bool? favorite;
  final bool shouldShowFavoriteIcon;
}

class CommunityFilterSheet {
  const CommunityFilterSheet._();

  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    required List<CommunityCategoryItem> items,
  }) {
    return BottomSheetPage(
      key: key,
      contentBuilder: (_) {
        return _CommunityPostCategoriesSheet(
          items: items,
        );
      },
    );
  }
}

class _CommunityPostCategoriesSheet extends StatefulWidget {
  const _CommunityPostCategoriesSheet({
    this.items = const [],
  });

  final List<CommunityCategoryItem> items;

  @override
  State<_CommunityPostCategoriesSheet> createState() =>
      _CommunityPostCategoriesSheetState();
}

class _CommunityPostCategoriesSheetState
    extends State<_CommunityPostCategoriesSheet> {
  final Set<int> _favoriteId = {};

  @override
  void initState() {
    super.initState();
    for (final element in widget.items) {
      if (element.id != null && (element.favorite ?? false)) {
        _favoriteId.add(element.id!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.items
            .map(
              (e) => AppListTile(
                title: Text(e.label),
                onTap: () {
                  context.pop(e);
                },
                trailing: !e.shouldShowFavoriteIcon
                    ? null
                    : Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: AppIconButton(
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: KeyedSubtree(
                              key: ValueKey(_favoriteId.contains(e.id)),
                              child: _favoriteId.contains(e.id)
                                  ? Assets.svgs.bookmarkedIcon.svg()
                                  : Assets.svgs.bookmarkIcon.svg(),
                            ),
                          ),
                          onTap: () async {
                            final isLoggedIn =
                                await requestLoginAction(context);
                            if (!context.mounted) {
                              return;
                            }
                            if (!isLoggedIn) {
                              return;
                            }
                            final categoryId = e.id;
                            if (categoryId == null) {
                              return;
                            }
                            final userFavoriteCategoryController =
                                context.read<UserFavoriteCategoryController>();

                            if (_favoriteId.contains(categoryId)) {
                              _favoriteId.remove(categoryId);
                            } else {
                              _favoriteId.add(categoryId);
                            }
                            userFavoriteCategoryController
                                .setCategoryIsFavorite(
                              categoryId: categoryId,
                              request: FavoriteCategoryRequest(
                                isFavorite: _favoriteId.contains(categoryId),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      ),
              ),
            )
            .toList(),
      ),
    );
  }
}
