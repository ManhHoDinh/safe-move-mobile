import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/file/file.dart';
import '../../../../application/services/product/product.dart';
import '../../../bases/cart_cubit/cart_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/widgets/add_to_cart/add_to_cart_icon.dart';
import '../../../shared/widgets/app_bar/common_app_bar.dart';
import '../../../shared/widgets/app_icon_button.dart';
import '../../../shared/widgets/snack_bar/app_snack_bar.dart';
import '../../../utilities/category_name_resolver.dart';
import '../../../utilities/request_login.dart';
import '../../../utilities/share_link.dart';
import '../blocs/product_detail_cubit.dart';
import '../blocs/product_detail_state.dart';
import 'product_carousel_section.dart';

class CarouselAppBar extends StatelessWidget {
  const CarouselAppBar({super.key, required this.cartKey});

  final GlobalKey<CartIconKey> cartKey;

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    final double deltaExtent = settings.maxExtent - settings.minExtent;
    return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = 50 + MediaQuery.of(context).padding.top;
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
      final ProductResponse productData = state.productResponse;
      final List<ProductImage> items = [];
      for (final FileResponse image in productData.images ?? []) {
        if (image.previewUrl != null) {
          items.add(ProductImage(imagePath: image.previewUrl!));
        }
      }

      return SliverAppBar(
        primary: false,
        pinned: true,
        toolbarHeight: appBarHeight,
        collapsedHeight: appBarHeight,
        expandedHeight: 378,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.gray.shade70,
        scrolledUnderElevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final FlexibleSpaceBarSettings settings =
                context.dependOnInheritedWidgetOfExactType<
                    FlexibleSpaceBarSettings>()!;

            final List<Widget> children = <Widget>[];

            final double deltaExtent = settings.maxExtent - settings.minExtent;

            // 0.0 -> Expanded
            // 1.0 -> Collapsed to toolbar
            final double t = ui.clampDouble(
                1.0 -
                    (settings.currentExtent - settings.minExtent) / deltaExtent,
                0.0,
                1.0);

            // background
            final double fadeStart =
                math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
            const double fadeEnd = 1.0;
            assert(fadeStart <= fadeEnd);
            // If the min and max extent are the same, the app bar cannot collapse
            // and the content should be visible, so opacity = 1.
            final double opacity = settings.maxExtent == settings.minExtent
                ? 1.0
                : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
            double height = settings.maxExtent;

            // StretchMode.zoomBackground
            if (constraints.maxHeight > height) {
              height = constraints.maxHeight;
            }
            final double topPadding = _getCollapsePadding(t, settings);
            children.add(
              Positioned(
                top: topPadding,
                left: 0.0,
                right: 0.0,
                height: height,
                child: _FlexibleSpaceHeaderOpacity(
                  // IOS is relying on this semantics node to correctly traverse
                  // through the app bar when it is collapsed.
                  alwaysIncludeSemantics: true,
                  opacity: opacity,
                  child: ProductsCarousel(items: items),
                ),
              ),
            );

            children.add(
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CommonAppBar(
                  color: Colors.transparent,
                  actions: [
                    AppIconButton(
                      icon: Assets.svgs.uploadIcon.svg(),
                      onTap: () async {
                        final String appLink = ProductDetailsRouteData(
                                productId: productData.id ?? 1)
                            .location;
                        final result = await shareLink(
                            appLink,
                            context,
                            resolveFieldValueName(context, productData.title) ??
                                '');
                        if (result != null && result && context.mounted) {
                          final AppSnackBar snackBar = AppSnackBar(
                              title: S.of(context).shareSuccessfully);
                          snackBar.showSnackBar(context);
                        }
                      },
                    ),
                    AddToCartIcon(
                      cartKey: cartKey,
                      onTap: () async {
                        final isLoggedIn = await requestLoginAction(context);
                        if (!context.mounted) {
                          return;
                        }
                        if (isLoggedIn) {
                          await const CartRouteData().push(context);
                          if (!context.mounted) {
                            return;
                          }

                          context.read<CartCubit>().reload();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );

            return ClipRect(
              child: Stack(
                children: children,
              ),
            );
          },
        ),
      );
    });
  }
}

class _FlexibleSpaceHeaderOpacity extends SingleChildRenderObjectWidget {
  const _FlexibleSpaceHeaderOpacity(
      {required this.opacity,
      required super.child,
      required this.alwaysIncludeSemantics});

  final double opacity;
  final bool alwaysIncludeSemantics;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderFlexibleSpaceHeaderOpacity(
        opacity: opacity, alwaysIncludeSemantics: alwaysIncludeSemantics);
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant _RenderFlexibleSpaceHeaderOpacity renderObject) {
    renderObject
      ..alwaysIncludeSemantics = alwaysIncludeSemantics
      ..opacity = opacity;
  }
}

class _RenderFlexibleSpaceHeaderOpacity extends RenderOpacity {
  _RenderFlexibleSpaceHeaderOpacity(
      {super.opacity, super.alwaysIncludeSemantics});

  @override
  bool get isRepaintBoundary => false;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    if ((opacity * 255).roundToDouble() <= 0) {
      layer = null;
      return;
    }
    assert(needsCompositing);
    layer = context.pushOpacity(offset, (opacity * 255).round(), super.paint,
        oldLayer: layer as OpacityLayer?);
    assert(() {
      layer!.debugCreator = debugCreator;
      return true;
    }());
  }
}
