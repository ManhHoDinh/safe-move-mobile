import 'dart:async';

import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/theme.dart';

class MainPopScope extends StatefulWidget {
  const MainPopScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainPopScope> createState() => _MainPopScopeState();
}

class _MainPopScopeState extends State<MainPopScope>
    with SingleTickerProviderStateMixin {
  bool _canPop = false;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _animation.addListener(() async {
      if (_animation.isCompleted) {
        await Future.delayed(const Duration(seconds: 3, milliseconds: 700));
        _controller.reverse();
      }
    });
  }

  void _onTriggerPop() async {
    if (_canPop) {
      return;
    }
    _controller.forward();
    final snackBar = SnackBar(
      elevation: 0,
      dismissDirection: DismissDirection.none,
      animation: _animation,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      content: FadeTransition(
        opacity: _animation,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.blue.shade500,
            ),
            child: Text(
              S.of(context).pressAgainToCloseApp,
              style: Styles.s12().withColor(AppColors.gray.shade70),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    final snackBarController =
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {
      _canPop = true;
    });
    await snackBarController.closed;
    setState(() {
      _canPop = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _onTriggerPop();
      },
      child: widget.child,
    );
  }
}
