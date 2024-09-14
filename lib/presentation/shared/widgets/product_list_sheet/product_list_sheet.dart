import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/file/file.dart';
import '../../../../application/services/user_order/user_order.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../utilities/category_name_resolver.dart';
import '../../theme/src/app_style.dart';
import '../model_route_pages/bottom_sheet_page.dart';
import '../ordered_product_item.dart';

class ProductListSheet {
  const ProductListSheet._();

  static Page<void> buildPage(
    BuildContext context, {
    required LocalKey key,
    required List<OrderDetailResponse> productList,
  }) {
    return BottomSheetPage(
      key: key,
      enableDrag: false,
      contentBuilder: (_) {
        return _ProductListSheet(
          productList: productList,
        );
      },
    );
  }
}

class _ProductListSheet extends StatelessWidget {
  const _ProductListSheet({
    required this.productList,
  });
  final List<OrderDetailResponse> productList;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.5),
                child: Text(
                  S.of(context).orderProduct,
                  style: Styles.s18()
                      .withHeight(18 / 18)
                      .withWeight(FontWeight.w600)
                      .withLetterSpacing(-2.5 / 100),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.5),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      final OrderDetailResponse orderDetailResponse =
                          productList[0];
                      final String image = _getImageUrl(
                          orderDetailResponse.productResponse?.images);
                      return OrderedProductItem(
                        productImage: image,
                        productName: resolveFieldValueName(context,
                            orderDetailResponse.productResponse?.title),
                        productPrice:
                            orderDetailResponse.productResponse?.currentPrice,
                        productCount: orderDetailResponse.quantity,
                        onTap: () async {
                          if (orderDetailResponse.productResponse?.id != null) {
                            final checked = await ComposeQARouteData(
                                    productId: orderDetailResponse
                                        .productResponse!.id!)
                                .push<bool>(context);

                            if (context.mounted && checked != null && checked) {
                              context.pop();
                            }
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: productList.length,
                  ),
                ),
              ),
            ],
          );
        });
  }

  String _getImageUrl(List<FileResponse>? images) {
    final List<String> items = [];
    for (final FileResponse image in images ?? []) {
      if (image.previewUrl != null) {
        items.add(image.previewUrl!);
      }
    }
    return items.first;
  }
}
