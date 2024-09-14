import 'package:flutter/widgets.dart';

class DragToCartAnimationOptions {
  const DragToCartAnimationOptions({
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
    this.rotation = false,
  });

  /// What Should the given widget's jump duration on jump
  final Duration duration;

  /// Should the given widget rotate while dragging to the cart
  final bool rotation;

  /// What Should the given widget's curve while jump to the cart
  final Curve curve;
}
