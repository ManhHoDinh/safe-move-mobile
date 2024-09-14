import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../../bases/childless_assertion/childless_assertion.dart';
import 'failure_handler_manager.dart';
import 'failure_handler_widget.dart';

class FailureHandlerScope extends SingleChildStatelessWidget
    with ChildlessAssertion {
  const FailureHandlerScope({super.key});

  @override
  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return BlocProvider<FailureHandlerManager>(
      create: (context) {
        return FailureHandlerManager();
      },
      child: child,
    );
  }
}

class FailureHandler extends SingleChildStatelessWidget {
  const FailureHandler({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Nested(
      children: const [
        FailureHandlerScope(),
        FailureHandlerWidget(),
      ],
      child: child,
    );
  }
}
