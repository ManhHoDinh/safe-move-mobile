import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../theme/theme.dart';

class TermsBigTitle extends StatelessWidget {
  const TermsBigTitle({
    super.key,
    required this.text,
    this.midTitles = const [],
    this.bigContent,
  });

  final String text;
  final String? bigContent;
  final List<TermsMidTitle> midTitles;

  @override
  Widget build(BuildContext context) {
    final List<Widget> contents = [];
    contents.add(const SizedBox(height: 16));

    for (int i = 0; i < midTitles.length; i++) {
      contents.add(midTitles[i]);
      if (i < midTitles.length - 1) {
        contents.add(const SizedBox(height: 40));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          text,
          style: Styles.s18()
              .withLetterSpacing(-4.5 / 100)
              .withWeight(FontWeight.w600)
              .withColor(AppColors.text.main),
        ),
        if (bigContent != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bigContent!,
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withColor(AppColors.text.main)
                    .withLetterSpacing(-2.5 / 100),
              ),
              const SizedBox(height: 32)
            ],
          ),
        ...contents,
      ],
    );
  }
}

class TermsMidTitle extends StatelessWidget {
  const TermsMidTitle({
    super.key,
    required this.text,
    this.smallTitles = const [],
  });

  final String text;
  final List<TermSmallTitle> smallTitles;

  @override
  Widget build(BuildContext context) {
    final List<Widget> contents = [];
    if (smallTitles.isNotEmpty) {
      contents.add(const SizedBox(height: 20));
    }

    for (int i = 0; i < smallTitles.length; i++) {
      contents.add(smallTitles[i]);
      if (i < smallTitles.length - 1) {
        contents.add(const SizedBox(height: 12));
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.s16()
              .withLetterSpacing(-4 / 100)
              .withHeight(22 / 16)
              .withWeight(FontWeight.w600)
              .withColor(AppColors.text.main),
        ),
        ...contents,
      ],
    );
  }
}

class TermSmallTitle extends StatelessWidget {
  const TermSmallTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.s15()
          .withHeight(24 / 15)
          .withColor(AppColors.text.common)
          .withLetterSpacing(-2.5 / 100),
    );
  }
}
