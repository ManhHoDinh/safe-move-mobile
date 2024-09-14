import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../gen/app_colors.dart';
import '../../../shared/base_infinite_loading/image_loading.dart';
import '../../../shared/theme/src/app_style.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final helperImage = ImageLoading(
      width: MediaQuery.of(context).size.width,
      height: 378,
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.network(
          imagePath,
          loadingBuilder: helperImage.loadingBuilder,
          errorBuilder: helperImage.errorBuilder,
        ),
      ),
    );
  }
}

class ProductsCarousel extends StatefulWidget {
  const ProductsCarousel({super.key, required this.items});

  final List<ProductImage> items;

  static const height = 378.0;

  @override
  State<ProductsCarousel> createState() => _ProductsCarouselState();
}

class _ProductsCarouselState extends State<ProductsCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          color: AppColors.black.withOpacity(0.1),
          height: ProductsCarousel.height,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return items[index];
            },
            options: CarouselOptions(
              onPageChanged: (page, reason) {
                setState(() {
                  _currentIndex = page;
                });
              },
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlay: true,
              initialPage: _currentIndex,
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 18,
          child: _ProductCarouselCounter(
              currentIndex: _currentIndex, totalCount: items.length),
        )
      ],
    );
  }
}

class _ProductCarouselCounter extends StatelessWidget {
  const _ProductCarouselCounter({
    required this.currentIndex,
    required this.totalCount,
  });

  final int currentIndex;
  final int totalCount;
  static const animationDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Styles.s12().withHeight(1).withColor(AppColors.text.common);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white.withOpacity(0.6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      child: DefaultTextStyle(
        style: textStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: animationDuration,
              child: Text(
                '${currentIndex + 1}',
                key: ValueKey(currentIndex),
              ),
            ),
            const SizedBox(width: 4),
            const Text('/'),
            const SizedBox(width: 4),
            Text(totalCount.toString()),
          ],
        ),
      ),
    );
  }
}
