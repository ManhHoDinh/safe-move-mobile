import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nested/nested.dart';

import 'childless_exceptions.dart';

mixin ChildlessAssertion on SingleChildStatelessWidget {
  @nonVirtual
  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(() {
      if (child == null) {
        throw const ChildlessUsageNotAllowed();
      }
      return true;
    }());
    return buildWithNoneNullChild(context, child!);
  }

  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return child;
  }
}
