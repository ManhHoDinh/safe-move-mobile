import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/app_list_tile.dart';
import '../../../shared/widgets/model_route_pages/bottom_sheet_page.dart';

class ProductCategoryItem {
  const ProductCategoryItem({
    this.id,
    required this.label,
  });

  final int? id;
  final String label;
}

class ProductFilterSheet {
  const ProductFilterSheet._();

  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    required List<ProductCategoryItem> items,
  }) {
    return BottomSheetPage(
      key: key,
      contentBuilder: (_) {
        return _ProductCategoriesSheet(
          items: items,
        );
      },
    );
  }
}

class _ProductCategoriesSheet extends StatelessWidget {
  const _ProductCategoriesSheet({
    this.items = const [],
  });

  final List<ProductCategoryItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items
          .map(
            (e) => AppListTile(
              title: Text(e.label),
              onTap: () {
                context.pop(e);
              },
            ),
          )
          .toList(),
    );
  }
}
