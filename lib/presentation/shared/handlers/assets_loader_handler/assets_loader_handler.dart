import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nested/nested.dart';

import '../../../../utilities/logging/logging.dart';
import '../../../bases/bootstrap_cubit/bootstrap_cubit.dart';
import '../../../bases/childless_assertion/src/state_childless_assertion.dart';
import '../../../gen/assets.gen.dart';

class AssetsLoaderHandler extends SingleChildStatefulWidget {
  const AssetsLoaderHandler({super.key});

  static List<String> getImagesList() {
    final List<String> imagePaths = [];
    return imagePaths;
  }

  @override
  State<AssetsLoaderHandler> createState() => _AssetsLoaderHandlerState();
}

class _AssetsLoaderHandlerState extends SingleChildState<AssetsLoaderHandler>
    with StateChildlessAssertion {
  final _preloadSvgFuture = Completer<void>();
  final _preloadImageFuture = Completer<void>();

  void _preloadSvg() async {
    if (_preloadSvgFuture.isCompleted) {
      return;
    }
    try {
      for (final image in Assets.svgs.values) {
        final SvgAssetLoader loader = SvgAssetLoader(image.path);
        await svg.cache
            .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
      }
    } catch (error) {
      logging.e(error);
    } finally {
      _preloadSvgFuture.complete();
    }
  }

  void _preloadImages(BuildContext context) async {
    if (_preloadImageFuture.isCompleted) {
      return;
    }
    try {
      final List<String> imagePaths = AssetsLoaderHandler.getImagesList();
      for (final path in imagePaths) {
        await precacheImage(AssetImage(path), context);
      }
    } catch (error) {
      logging.e(error);
    } finally {
      _preloadImageFuture.complete();
    }
  }

  void _loaderCompleted() async {
    await Future.wait([
      _preloadImageFuture.future,
      _preloadSvgFuture.future,
    ]);
    if (!mounted) {
      return;
    }
    context.read<BootstrapCubit>().assetLoadingCompleted();
  }

  @override
  void initState() {
    super.initState();
    _preloadSvg();
    _loaderCompleted();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImages(context);
  }
}
