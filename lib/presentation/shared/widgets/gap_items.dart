import 'package:flutter/material.dart';

class GapItems extends StatelessWidget {
  const GapItems({
    super.key,
    this.items = const [],
    this.gap = 12,
    this.axis = Axis.vertical,
    this.separate,
    this.crossAxisAlignmentRow = CrossAxisAlignment.start,
  });

  final double gap;
  final Axis axis;
  final Widget? separate;
  final List<Widget> items;
  final CrossAxisAlignment crossAxisAlignmentRow;

  @override
  Widget build(BuildContext context) {
    final List<Widget> renderItem = [];
    for (int i = 0; i < items.length; i++) {
      renderItem.add(items[i]);
      if (i < items.length - 1) {
        renderItem.add(separate ??
            SizedBox(
              height: axis == Axis.vertical ? gap : 0,
              width: axis == Axis.horizontal ? gap : 0,
            ));
      }
    }
    if (axis == Axis.horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: crossAxisAlignmentRow,
        mainAxisSize: MainAxisSize.min,
        children: renderItem,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: renderItem,
    );
  }
}
