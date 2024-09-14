import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../theme/src/app_style.dart';
import 'common_app_bar_template.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.onLogoTap,
    this.height = 50,
    this.title,
    this.titleSpacing,
    this.closeIcon,
    this.centerTitle = false,
    this.color,
    this.leadingWidth,
    this.leading,
  });

  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final VoidCallback? onLogoTap;
  final double height;
  final Widget? title;
  final bool centerTitle;
  final double? titleSpacing;
  final Widget? closeIcon;
  final Color? color;
  final Widget? leading;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return CommonAppBarTemplate(
      height: height,
      actions: actions,
      titleSpacing: titleSpacing,
      automaticallyImplyLeading: automaticallyImplyLeading,
      color: color ?? AppColors.gray.shade70,
      closeIcon: closeIcon,
      leadingWidth: leadingWidth,
      leading: leading,
      title: DefaultTextStyle(
        style: Styles.s18()
            .withHeight(1)
            .withLetterSpacing(-2.5 / 100)
            .withWeight(FontWeight.w600)
            .withColor(AppColors.text.main),
        child: title ?? const SizedBox.shrink(),
      ),
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
