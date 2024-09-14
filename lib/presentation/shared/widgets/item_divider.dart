import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key, this.padding, this.thickness, this.color});

  final EdgeInsets? padding;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
      child: Divider(
        color: color ?? AppColors.gray.shade100,
        height: 4,
        thickness: thickness ?? 4,
      ),
    );
  }
}
