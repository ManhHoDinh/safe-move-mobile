import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class StatusBarHeight {
  const StatusBarHeight({
    required this.height,
  });

  final double height;
}

class StatusBarHeightProvider extends SingleChildStatelessWidget {
  const StatusBarHeightProvider({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final statusBarHeight =
        StatusBarHeight(height: MediaQuery.of(context).viewPadding.top);
    return Provider.value(
      value: statusBarHeight,
      child: child,
    );
  }
}
