import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/common/common.dart';
import '../../../shared/widgets/app_list_tile.dart';
import '../../../shared/widgets/model_route_pages/bottom_sheet_page.dart';

class LanguageItem {
  const LanguageItem({
    this.language,
    required this.label,
  });

  final PostLanguage? language;
  final String label;
}

class PostLanguageSheet {
  const PostLanguageSheet._();

  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    required List<LanguageItem> items,
  }) {
    return BottomSheetPage(
      key: key,
      contentBuilder: (_) {
        return _PostLanguageSheet(
          items: items,
        );
      },
    );
  }
}

class _PostLanguageSheet extends StatelessWidget {
  const _PostLanguageSheet({
    this.items = const [],
  });

  final List<LanguageItem> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}
