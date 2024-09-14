import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import '../../childless_assertion/childless_assertion.dart';
import 'global_key_provider.dart';

class GlobalKeyProviderWrapper<T extends State<StatefulWidget>>
    extends SingleChildStatelessWidget with ChildlessAssertion {
  const GlobalKeyProviderWrapper({
    super.key,
    this.children = const [],
    this.globalKey,
    super.child,
  });

  final List<SingleChildWidget> children;
  final GlobalKey<T>? globalKey;

  @override
  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return Nested(
      children: [
        GlobalKeyProvider<T>(
          globalKey: globalKey,
        ),
        ...children,
      ],
      child: child,
    );
  }
}
