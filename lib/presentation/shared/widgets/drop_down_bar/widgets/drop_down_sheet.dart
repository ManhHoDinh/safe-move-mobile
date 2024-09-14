import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_list_tile.dart';
import '../../model_route_pages/bottom_sheet_page.dart';
import '../drop_down_bar.dart';

class DropdownSheet {
  const DropdownSheet._();

  static Page<void> buildPage<T>(
    BuildContext context, {
    required LocalKey key,
    required List<DropDownBarData<T>> items,
  }) {
    return BottomSheetPage(
      key: key,
      contentBuilder: (_) {
        return _DropdownSheet<T>(
          items: items,
        );
      },
    );
  }
}

class _DropdownSheet<T> extends StatelessWidget {
  const _DropdownSheet({
    this.items = const [],
  });

  final List<DropDownBarData<T>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items
          .map(
            (e) => AppListTile(
              title: Text(
                e.title,
                style: e.textStyle,
              ),
              onTap: () {
                context.pop(e.value);
              },
            ),
          )
          .toList(),
    );
  }
}
