import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'infinite_loading_cubit.dart';

typedef InfiniteWidgetBuilder<S extends InfiniteLoaderState<Object>> = Widget
    Function(BuildContext context, ScrollController controller, S state);

typedef InfiniteWidgetUnControlledBuilder<S extends InfiniteLoaderState<Object>>
    = Widget Function(BuildContext context, S state);

class InfiniteLoaderWrapper<C extends InfiniteLoaderCubit<S, Object>,
    S extends InfiniteLoaderState<Object>> extends StatefulWidget {
  const InfiniteLoaderWrapper({
    super.key,
    required Create<C> this.create,
    this.trigger = 0.8,
    this.controller,
    required this.builder,
  })  : _created = true,
        value = null;

  const InfiniteLoaderWrapper.value({
    super.key,
    required C this.value,
    this.trigger = 0.8,
    this.controller,
    required this.builder,
  })  : _created = false,
        create = null;

  final double trigger;
  final Create<C>? create;
  final C? value;
  final ScrollController? controller;
  final InfiniteWidgetBuilder<S> builder;
  final bool _created;

  @override
  State<InfiniteLoaderWrapper<C, S>> createState() =>
      _InfiniteLoaderWrapperState<C, S>();
}

class _InfiniteLoaderWrapperState<C extends InfiniteLoaderCubit<S, Object>,
        S extends InfiniteLoaderState<Object>>
    extends State<InfiniteLoaderWrapper<C, S>> {
  @override
  Widget build(BuildContext context) {
    final child = _InfiniteLoaderWrapperInternal<C, S>(
      builder: widget.builder,
      trigger: widget.trigger,
      controller: widget.controller,
    );
    if (widget._created) {
      return BlocProvider<C>(
        lazy: false,
        create: widget.create!,
        child: child,
      );
    }
    return BlocProvider<C>.value(
      value: widget.value!,
      child: child,
    );
  }
}

class _InfiniteLoaderWrapperInternal<C extends InfiniteLoaderCubit<S, Object>,
    S extends InfiniteLoaderState<Object>> extends StatefulWidget {
  const _InfiniteLoaderWrapperInternal({
    super.key,
    required this.builder,
    required this.trigger,
    this.controller,
  });

  final double trigger;
  final ScrollController? controller;
  final InfiniteWidgetBuilder<S> builder;

  @override
  State<_InfiniteLoaderWrapperInternal<C, S>> createState() =>
      _InfiniteLoaderWrapperStateInternal<C, S>();
}

class _InfiniteLoaderWrapperStateInternal<
        C extends InfiniteLoaderCubit<S, Object>,
        S extends InfiniteLoaderState<Object>>
    extends State<_InfiniteLoaderWrapperInternal<C, S>> {
  late double _trigger;
  late final bool _controllerCreated;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _trigger = widget.trigger;
    if (widget.controller != null) {
      _controller = widget.controller!;
      _controllerCreated = false;
    } else {
      _controller = ScrollController();
      _controllerCreated = true;
    }
    _controller.addListener(_triggerLoadMore);
  }

  void _triggerLoadMore() {
    if (!_controller.hasClients) {
      return;
    }
    final maxScrollExtends = _controller.position.maxScrollExtent;
    final currentScrollExtends = _controller.position.pixels;
    if (currentScrollExtends > maxScrollExtends * _trigger) {
      context.read<C>().more();
    }
  }

  @override
  void didUpdateWidget(
      covariant _InfiniteLoaderWrapperInternal<C, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger != _trigger) {
      _trigger = widget.trigger;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_triggerLoadMore);
    if (_controllerCreated) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<C>().state;
    return widget.builder(context, _controller, state);
  }
}

class InfiniteLoaderUnControlledWrapper<
    C extends InfiniteLoaderCubit<S, Object>,
    S extends InfiniteLoaderState<Object>> extends StatefulWidget {
  const InfiniteLoaderUnControlledWrapper({
    super.key,
    required Create<C> this.create,
    this.trigger = 0.8,
    required this.builder,
  })  : _created = true,
        value = null;

  const InfiniteLoaderUnControlledWrapper.value({
    super.key,
    required C this.value,
    this.trigger = 0.8,
    required this.builder,
  })  : _created = false,
        create = null;

  final double trigger;
  final Create<C>? create;
  final C? value;
  final InfiniteWidgetUnControlledBuilder<S> builder;
  final bool _created;

  @override
  State<InfiniteLoaderUnControlledWrapper<C, S>> createState() =>
      _InfiniteLoaderUnControlledWrapperState<C, S>();
}

class _InfiniteLoaderUnControlledWrapperState<
        C extends InfiniteLoaderCubit<S, Object>,
        S extends InfiniteLoaderState<Object>>
    extends State<InfiniteLoaderUnControlledWrapper<C, S>> {
  @override
  Widget build(BuildContext context) {
    final child = _InfiniteLoaderUnControlledWrapperInternal<C, S>(
      builder: widget.builder,
      trigger: widget.trigger,
    );
    if (widget._created) {
      return BlocProvider<C>(
        lazy: false,
        create: widget.create!,
        child: child,
      );
    }
    return BlocProvider<C>.value(
      value: widget.value!,
      child: child,
    );
  }
}

class _InfiniteLoaderUnControlledWrapperInternal<
    C extends InfiniteLoaderCubit<S, Object>,
    S extends InfiniteLoaderState<Object>> extends StatefulWidget {
  const _InfiniteLoaderUnControlledWrapperInternal({
    super.key,
    required this.builder,
    required this.trigger,
  });

  final double trigger;
  final InfiniteWidgetUnControlledBuilder<S> builder;

  @override
  State<_InfiniteLoaderUnControlledWrapperInternal<C, S>> createState() =>
      _InfiniteLoaderUnControlledWrapperStateInternal<C, S>();
}

class _InfiniteLoaderUnControlledWrapperStateInternal<
        C extends InfiniteLoaderCubit<S, Object>,
        S extends InfiniteLoaderState<Object>>
    extends State<_InfiniteLoaderUnControlledWrapperInternal<C, S>> {
  late double _trigger;

  @override
  void initState() {
    super.initState();
    _trigger = widget.trigger;
  }

  void _triggerLoadMore(ScrollNotification notification) {
    final maxScrollExtends = notification.metrics.maxScrollExtent;
    final currentScrollExtends = notification.metrics.pixels;
    if (currentScrollExtends > maxScrollExtends * _trigger) {
      context.read<C>().more();
    }
  }

  @override
  void didUpdateWidget(
      covariant _InfiniteLoaderUnControlledWrapperInternal<C, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.trigger != _trigger) {
      _trigger = widget.trigger;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<C>().state;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _triggerLoadMore(notification);
        return false;
      },
      child: widget.builder(context, state),
    );
  }
}
