import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/file/file.dart';
import '../../../../application/services/user_order_session/user_order_session.dart';
import '../../../shared/widgets/ordered_product_item.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/order_session_cubit.dart';
import '../blocs/order_session_detail_state.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSessionCubit, OrderSessionState>(
        builder: (context, state) {
      final dataOrderSession = state.orderSessionResponse;
      return state.loading
          ? ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              itemCount: 50,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const OrderedProductItem(
                  loading: true,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            )
          : ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              itemCount:
                  dataOrderSession?.orderDetailSessionResponse?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final OrderDetailSessionResponse orderDetailResponse =
                    dataOrderSession!.orderDetailSessionResponse![index];
                final String image =
                    _getImageUrl(orderDetailResponse.productResponse?.images);
                return OrderedProductItem(
                  productImage: image,
                  productName: resolveFieldValueName(
                      context, orderDetailResponse.productResponse?.title),
                  productPrice:
                      orderDetailResponse.productResponse?.currentPrice,
                  productCount: orderDetailResponse.quantity,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
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
