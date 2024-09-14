import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../app_icon_button.dart';

class CommonAppBarTemplate extends StatelessWidget
    implements PreferredSizeWidget {
  const CommonAppBarTemplate({
    super.key,
    this.title,
    this.actions,
    this.color,
    this.iconBrightness = Brightness.dark,
    this.automaticallyImplyLeading = true,
    required this.height,
    this.leading,
    this.leadingWidth,
    this.titleSpacing,
    this.closeIcon,
    this.centerTitle = false,
  });

  final bool automaticallyImplyLeading;
  final double height;
  final Widget? closeIcon;

  final Color? color;
  final bool centerTitle;
  final Widget? title;
  final List<Widget>? actions;
  final Brightness iconBrightness;
  final Widget? leading;
  final double? leadingWidth;
  final double? titleSpacing;

  @override
  Widget build(BuildContext context) {
    final Color resolvedColor = color ?? AppColors.gray.shade70;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final shouldShowBackButton = parentRoute?.impliesAppBarDismissal ?? false;

    Widget? resolvedLeading;

    if (leading != null) {
      resolvedLeading = leading;
    } else if (shouldShowBackButton && automaticallyImplyLeading) {
      resolvedLeading = AppIconButton(
        icon: closeIcon ?? Assets.svgs.chevronLeft24.svg(),
        onTap: () {
          context.pop();
        },
      );
    }

    return AppBar(
      toolbarHeight: height,
      leading: resolvedLeading != null
          ? Container(
              margin: const EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              child: resolvedLeading,
            )
          : null,
      leadingWidth: leadingWidth ?? 40 + 10,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: resolvedColor,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: resolvedColor,
        statusBarIconBrightness: iconBrightness,
        statusBarBrightness: iconBrightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      ),
      titleSpacing: titleSpacing ?? 18,
      title: title,
      centerTitle: centerTitle,
      actions: [
        _AppBarActionBar(
          actions: actions,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarActionBar extends StatelessWidget {
  const _AppBarActionBar({this.actions});

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: actions ?? [],
      ),
    );
  }
}
