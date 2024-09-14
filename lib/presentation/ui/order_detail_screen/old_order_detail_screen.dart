import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/file/file.dart';
import '../../../application/services/user_order/user_order.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/item_divider.dart';
import '../../shared/widgets/ordered_product_item.dart';
import '../../utilities/category_name_resolver.dart';
import 'blocs/order_detail_cubit.dart';
import 'blocs/order_detail_state.dart';
import 'widgets/orderer_info_section.dart';
import 'widgets/payment_info_section.dart';
import 'widgets/shipping_info_section.dart';

class OldOrderDetailScreen extends StatelessWidget {
  const OldOrderDetailScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OrderDetailCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          orderController: context.read<UserOrderController>(),
          id: id,
        );
      },
      child: BlocBuilder<OrderDetailCubit, OrderDetailState>(
          builder: (context, state) {
        final dataOrder = state.orderResponse;

        return Scaffold(
          appBar: CommonAppBar(
            title: Text(
              S.of(context).orderDetails,
              style: Styles.s15()
                  .withLetterSpacing(-2.5 / 100)
                  .withWeight(FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<OrderDetailCubit>().reload();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.5),
                      child: state.loading
                          ? const AppShimmer(
                              child: ShippingInfoSection(
                              loading: true,
                            ))
                          : ShippingInfoSection(
                              title: dataOrder?.mainAddress,
                              content: dataOrder?.detailAddress,
                              phone: dataOrder?.phoneNumber,
                              name: dataOrder?.name,
                            ),
                    ),
                    const ItemDivider(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        thickness: 4),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.5),
                      child: state.loading
                          ? ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              itemCount: 50,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const AppShimmer(
                                  child: OrderedProductItem(
                                    productCount: 4,
                                    productPrice: 1,
                                    loading: true,
                                  ),
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
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final OrderDetailResponse orderDetailResponse =
                                    dataOrder!.orderDetailResponses![index];
                                final String image = _getImageUrl(
                                    orderDetailResponse
                                        .productResponse?.images);
                                return OrderedProductItem(
                                  productImage: image,
                                  productName: resolveFieldValueName(
                                      context,
                                      orderDetailResponse
                                          .productResponse?.title),
                                  productPrice: orderDetailResponse
                                      .productResponse?.currentPrice,
                                  productCount: orderDetailResponse.quantity,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              itemCount:
                                  dataOrder?.orderDetailResponses?.length ?? 0,
                            ),
                    ),
                    const ItemDivider(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        thickness: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.5),
                      child: PaymentInfoSection(
                        totalProductAmount: dataOrder?.productsPrice ?? 0,
                        deliveryFee: dataOrder?.shippingFee ?? 0,
                        totalDiscountAmount: dataOrder?.discountPrice ?? 0,
                        paymentAmount: dataOrder?.totalPrice ?? 0,
                        pointAccumulation: dataOrder?.discountPrice ?? 0,
                      ),
                    ),
                    const ItemDivider(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        thickness: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.5),
                      child: OrdererInfoSection(
                        ordererName: dataOrder?.user?.name,
                        phoneNumber: dataOrder?.user?.phoneNumber,
                        email: dataOrder?.user?.email,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
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
