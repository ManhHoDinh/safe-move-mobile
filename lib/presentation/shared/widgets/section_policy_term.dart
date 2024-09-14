import 'package:flutter/cupertino.dart';

import '../../gen/app_colors.dart';
import '../theme/src/app_style.dart';

class SectionPolicyTerm extends StatelessWidget {
  const SectionPolicyTerm({
    super.key,
    this.contents = const [],
    required this.title,
  });

  final String Function(BuildContext context) title;
  final List<List<Widget>> contents;

  @override
  Widget build(BuildContext context) {
    final List<Widget> renderContents = [];
    for (int i = 0; i < contents.length; i++) {
      for (int j = 0; j < contents[i].length; j++) {
        renderContents.add(contents[i][j]);
      }
      if (i < contents.length - 1) {
        renderContents
            .add(const Padding(padding: EdgeInsets.symmetric(vertical: 6)));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.call(context),
          style: Styles.s16()
              .withLetterSpacing(-4 / 100)
              .withHeight(22 / 16)
              .withWeight(FontWeight.w600)
              .withColor(AppColors.text.main),
        ),
        const SizedBox(height: 20),
        if (contents.isNotEmpty) ...renderContents
      ],
    );
  }
}
