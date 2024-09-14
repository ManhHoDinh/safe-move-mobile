import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../theme/theme.dart';
import '../app_icon_button.dart';

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    super.key,
    this.expanded = false,
    required this.title,
    this.content,
    this.contentBackgroundColor,
    this.contentPadding,
    this.titleBackgroundColor,
    this.titlePadding,
    this.animationDuration = const Duration(milliseconds: 200),
    this.icon,
    this.onTitleTap,
    this.onExpandTap,
    this.iconCenter = true,
    this.useDefaultTextStyle = true,
  });

  final bool expanded;
  final Widget title;
  final EdgeInsets? titlePadding;
  final Color? titleBackgroundColor;
  final Widget? content;
  final EdgeInsets? contentPadding;
  final Color? contentBackgroundColor;
  final Duration animationDuration;
  final Widget? icon;
  final VoidCallback? onTitleTap;
  final VoidCallback? onExpandTap;
  final bool iconCenter;
  final bool useDefaultTextStyle;

  @override
  State<AppExpansionTile> createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile>
    with TickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  late final AnimationController _animationController;
  late final Animation<double> _iconTurns;
  late final Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    _heightFactor = _animationController.drive(_easeInTween);
    if (widget.expanded) {
      _animationController.value = 1;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animationDuration != oldWidget.animationDuration) {
      _animationController.duration = widget.animationDuration;
    }
    if (widget.expanded != oldWidget.expanded) {
      if (widget.expanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: widget.titleBackgroundColor,
              child: Row(
                crossAxisAlignment: widget.iconCenter
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: widget.onTitleTap,
                        child: Container(
                          padding: widget.titlePadding,
                          child: widget.useDefaultTextStyle
                              ? DefaultTextStyle(
                                  style: Styles.s18()
                                      .withHeight(1)
                                      .withLetterSpacing(-2.5 / 100)
                                      .withWeight(FontWeight.w600)
                                      .withColor(AppColors.text.main),
                                  child: widget.title,
                                )
                              : widget.title,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: (widget.titlePadding?.right ?? 0) - 8),
                    child: RotationTransition(
                      turns: _iconTurns,
                      child: AppIconButton(
                        onTap: widget.onExpandTap,
                        icon: widget.icon ??
                            Assets.svgs.chevronDown24.svg(
                              color: AppColors.text.main,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRect(
              child: Align(
                heightFactor: _heightFactor.value,
                child: child,
              ),
            )
          ],
        );
      },
      child: Container(
        color: widget.contentBackgroundColor,
        padding: widget.contentPadding,
        child: widget.content,
      ),
    );
  }
}
