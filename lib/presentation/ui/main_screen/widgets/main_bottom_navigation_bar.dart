import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/theme.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    this.onSelected,
    required this.selected,
  });

  final void Function(int index)? onSelected;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.gray.shade70,
      child: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.gray.shade200,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: _BottomNavBarItem(
                  title: S.of(context).home,
                  onTap: () {
                    onSelected?.call(0);
                  },
                  iconPath: Assets.svgs.tabBarHome.path,
                  selected: selected == 0,
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  selected: selected == 1,
                  title: S.of(context).community,
                  onTap: () {
                    onSelected?.call(1);
                  },
                  iconPath: Assets.svgs.tabBarCommunity.path,
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  selected: selected == 2,
                  title: S.of(context).curator,
                  onTap: () {
                    onSelected?.call(2);
                  },
                  iconPath: Assets.svgs.tabBarFeed.path,
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  selected: selected == 3,
                  title: S.of(context).news,
                  onTap: () {
                    onSelected?.call(3);
                  },
                  iconPath: Assets.svgs.tabBarNews.path,
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  selected: selected == 4,
                  title: S.of(context).store,
                  onTap: () {
                    onSelected?.call(4);
                  },
                  iconPath: Assets.svgs.tabBarShop.path,
                ),
              ),
              Expanded(
                child: _BottomNavBarItem(
                  selected: selected == 5,
                  title: S.of(context).profileNavText,
                  onTap: () {
                    onSelected?.call(5);
                  },
                  iconPath: Assets.svgs.tabBarProfile.path,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends ImplicitlyAnimatedWidget {
  const _BottomNavBarItem({
    required this.selected,
    required this.title,
    required this.iconPath,
    required this.onTap,
  }) : super(duration: const Duration(milliseconds: 300));

  final bool selected;
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  AnimatedWidgetBaseState<_BottomNavBarItem> createState() =>
      _BottomNavBarItemState();
}

class _BottomNavBarItemState
    extends AnimatedWidgetBaseState<_BottomNavBarItem> {
  final _unselectedTextColor = AppColors.text.common;
  final _textColor = AppColors.blue.shade500;
  final _unselectedIconColor = AppColors.gray.shade600;
  final _iconColor = AppColors.blue.shade500;

  ColorTween? _iconColorTween;
  ColorTween? _textColorTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _iconColorTween = visitor(
      _iconColorTween,
      widget.selected ? _iconColor : _unselectedIconColor,
      (dynamic value) => ColorTween(
        begin: value as Color,
      ),
    ) as ColorTween?;
    _textColorTween = visitor(
      _textColorTween,
      widget.selected ? _textColor : _unselectedTextColor,
      (dynamic value) => ColorTween(
        begin: value as Color,
      ),
    ) as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 12, bottom: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                widget.iconPath,
                colorFilter: ColorFilter.mode(
                  _iconColorTween?.evaluate(animation) ?? Colors.transparent,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 8),
              AutoSizeText(
                widget.title,
                style: Styles.s10().withHeight(1).copyWith(
                      color: _textColorTween?.evaluate(animation),
                    ),
                textAlign: TextAlign.center,
                minFontSize: 8,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
