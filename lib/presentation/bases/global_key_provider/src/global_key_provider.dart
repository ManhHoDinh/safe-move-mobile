import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class _GlobalKeyHolder<T extends State<StatefulWidget>> {
  _GlobalKeyHolder(this.key);

  final GlobalKey<T> key;
}

class GlobalKeyProvider<T extends State<StatefulWidget>>
    extends SingleChildStatelessWidget {
  const GlobalKeyProvider({
    super.key,
    this.globalKey,
    super.child,
  });
  final GlobalKey<T>? globalKey;

  static GlobalKey<T> of<T extends State<StatefulWidget>>(
      BuildContext context) {
    return context.read<_GlobalKeyHolder<T>>().key;
  }

  static GlobalKey<T>? maybeOf<T extends State<StatefulWidget>>(
      BuildContext context) {
    return context.read<_GlobalKeyHolder<T>?>()?.key;
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider<_GlobalKeyHolder<T>>(
      create: (context) {
        final key = globalKey ?? GlobalKey<T>();
        return _GlobalKeyHolder<T>(key);
      },
      child: child,
    );
  }
}
