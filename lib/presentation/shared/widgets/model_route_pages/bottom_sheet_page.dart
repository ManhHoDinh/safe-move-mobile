import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../status_bar_height_provider/status_bar_height_provider.dart';

class BottomSheetPage extends Page<void> {
  const BottomSheetPage({
    super.key,
    required this.contentBuilder,
    this.wrapContent = true,
    this.enableDrag = true,
  });

  final Widget Function(BuildContext context)? contentBuilder;
  final bool wrapContent;
  final bool enableDrag;

  @override
  Route<void> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: enableDrag,
      builder: (context) {
        return _BottomSheet(
          contentBuilder: contentBuilder,
          wrapContent: wrapContent,
        );
      },
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({
    this.wrapContent = false,
    this.contentBuilder,
  });

  final bool wrapContent;
  final Widget Function(BuildContext context)? contentBuilder;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      sized: false,
      child: Container(
        margin: EdgeInsets.only(
          top: context.watch<StatusBarHeight>().height,
        ),
        child: _BuildBody(
          wrapContent: wrapContent,
          contentBuilder: contentBuilder,
        ),
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({
    required this.wrapContent,
    required this.contentBuilder,
  });

  final bool wrapContent;
  final Widget Function(BuildContext context)? contentBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.gray.shade70,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: wrapContent ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (contentBuilder != null)
            Flexible(
              child: contentBuilder!.call(context),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
