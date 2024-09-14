import 'package:flutter/material.dart';

import '../../../utilities/api_status/api_status.dart';
import 'infinite_loading_cubit.dart';

class InfiniteLoaderCalculatorHelper<S extends InfiniteLoaderState<Object>> {
  const InfiniteLoaderCalculatorHelper(
    this.state, {
    this.loadingOffset = 1,
    this.errorOffset = 1,
  });

  final InfiniteLoaderState<Object> state;
  final int loadingOffset;
  final int errorOffset;

  bool get firstLoadError {
    return state.isFirstLoad && state.infiniteLoadingStatus == ApiStatus.fail;
  }

  bool get firstLoadInProgress {
    return state.isFirstLoad &&
        state.infiniteLoadingStatus == ApiStatus.loading;
  }

  int get length {
    if (firstLoadInProgress) {
      return 0;
    }
    if (state.infiniteLoadingStatus == ApiStatus.loading) {
      return state.data.length + loadingOffset;
    }
    if (state.infiniteLoadingStatus == ApiStatus.fail) {
      return state.data.length + errorOffset;
    }
    return state.data.length;
  }

  bool shouldRenderTrueItem(int index) {
    if (state.isFirstLoad) {
      return false;
    }
    return index < state.data.length;
  }

  bool shouldRenderErrorItem(int index) {
    if (state.isFirstLoad) {
      return false;
    }
    return state.infiniteLoadingStatus == ApiStatus.fail &&
        index >= state.data.length;
  }

  bool shouldRenderLoadingItem(int index) {
    if (state.isFirstLoad) {
      return false;
    }
    return state.infiniteLoadingStatus == ApiStatus.loading &&
        index >= state.data.length;
  }

  bool get emptyResult {
    return state.infiniteLoadingStatus != ApiStatus.loading &&
        state.infiniteLoadingStatus != ApiStatus.fail &&
        state.data.isEmpty;
  }

  Widget fullPageScrollable(BuildContext context, BoxConstraints constraints,
      {required WidgetBuilder builder}) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: constraints.maxHeight,
        child: builder.call(context),
      ),
    );
  }

  Widget renderItem(
    BuildContext context,
    int index, {
    WidgetBuilder? errorItemBuilder,
    required WidgetBuilder loadingItemBuilder,
    required WidgetBuilder itemBuilder,
  }) {
    if (shouldRenderLoadingItem(index)) {
      return loadingItemBuilder.call(context);
    }
    if (shouldRenderTrueItem(index)) {
      return itemBuilder.call(context);
    }
    if (shouldRenderErrorItem(index)) {
      return errorItemBuilder?.call(context) ?? const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}
