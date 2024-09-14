import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bases/cart_cubit/cart_cubit.dart';
import '../../../gen/assets.gen.dart';
import '../app_icon_button.dart';
import 'badge_options.dart';

export 'badge_options.dart';

class AddToCartIcon extends StatefulWidget {
  const AddToCartIcon({
    required this.cartKey,
    this.icon,
    this.badgeOptions = const BadgeOptions(),
    this.onTap,
  }) : super(key: cartKey);

  final GlobalKey<CartIconKey> cartKey;
  final Widget? icon;
  final BadgeOptions badgeOptions;
  final VoidCallback? onTap;

  @override
  CartIconKey createState() => CartIconKey();
}

class CartIconKey extends State<AddToCartIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 225),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.6, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: AppIconButton(
        icon: widget.icon ?? Assets.svgs.cartIcon.svg(),
        notificationCount: context.watch<CartCubit>().state.totalItems == 0
            ? null
            : context.watch<CartCubit>().state.totalItems,
        onTap: widget.onTap,
      ),
    );
  }

  Future<void> runCartAnimation() async {
    await _controller.forward();
    await _controller.reverse();
    return;
  }
}
