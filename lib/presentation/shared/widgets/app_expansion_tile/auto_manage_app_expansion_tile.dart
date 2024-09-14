import 'package:flutter/material.dart';

import 'app_expansion_tile.dart';

class AutoManageAppExpansionTile extends StatefulWidget {
  const AutoManageAppExpansionTile({
    super.key,
    this.initialExpanded = false,
    required this.title,
    this.content,
    this.contentBackgroundColor,
    this.contentPadding,
    this.titleBackgroundColor,
    this.titlePadding,
    this.animationDuration = const Duration(milliseconds: 200),
    this.onTitleTap,
    this.icon,
    this.enableCollapse = true,
    this.iconCenter = true,
    this.useDefaultTextStyle = true,
  });

  final bool initialExpanded;
  final Widget title;
  final EdgeInsets? titlePadding;
  final Color? titleBackgroundColor;
  final Widget? content;
  final EdgeInsets? contentPadding;
  final Color? contentBackgroundColor;
  final Duration animationDuration;
  final Widget? icon;
  final VoidCallback? onTitleTap;
  final bool enableCollapse;
  final bool iconCenter;
  final bool useDefaultTextStyle;

  @override
  State<AutoManageAppExpansionTile> createState() =>
      _AutoManageAppExpansionTileState();
}

class _AutoManageAppExpansionTileState
    extends State<AutoManageAppExpansionTile> {
  late bool _expanded = widget.initialExpanded;

  @override
  Widget build(BuildContext context) {
    return AppExpansionTile(
      onExpandTap: !widget.enableCollapse
          ? null
          : () {
              setState(() {
                _expanded = !_expanded;
              });
            },
      onTitleTap: widget.onTitleTap != null
          ? () {
              widget.onTitleTap?.call();
            }
          : null,
      iconCenter: widget.iconCenter,
      expanded: _expanded,
      title: widget.title,
      useDefaultTextStyle: widget.useDefaultTextStyle,
      titlePadding: widget.titlePadding,
      titleBackgroundColor: widget.titleBackgroundColor,
      content: widget.content,
      contentPadding: widget.contentPadding,
      contentBackgroundColor: widget.contentBackgroundColor,
      animationDuration: widget.animationDuration,
      icon: widget.enableCollapse ? widget.icon : const SizedBox.shrink(),
    );
  }
}
