import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'loading_manager.dart';

class LoadingManagerScope extends SingleChildStatelessWidget {
  const LoadingManagerScope({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider<LoadingManager>(
      create: (context) => LoadingManager(),
      child: child,
    );
  }
}
