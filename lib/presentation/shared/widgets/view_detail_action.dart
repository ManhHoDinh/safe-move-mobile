import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../theme/theme.dart';

class ViewDetailAction extends StatelessWidget {
  const ViewDetailAction(
      {super.key, this.onTap, this.colors, required this.title});
  final VoidCallback? onTap;
  final String Function(BuildContext context) title;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.call(context),
                style: Styles.s13()
                    .withWeight(FontWeight.w500)
                    .withColor(colors ?? AppColors.blue.shade500)
                    .withLetterSpacing(-2.5 / 100),
              ),
              FittedBox(
                child: Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  child: Assets.svgs.chevronRight16.svg(
                    color: colors ?? AppColors.blue.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
