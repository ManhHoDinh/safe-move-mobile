import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/product/product.dart';
import '../../../application/services/user_order/user_order.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/empty.dart';
import '../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../shared/widgets/item_divider.dart';
import '../../utilities/category_name_resolver.dart';
import 'blocs/get_order_list_cubit.dart';
import 'blocs/get_order_list_state.dart';
import 'widgets/delivery_status_filter.dart';
import 'widgets/order_item.dart';

class CheckOrderDeliveryDetailScreen extends StatelessWidget {
  const CheckOrderDeliveryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const shimmerItem = AppShimmer(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: OrderItem(
        loading: true,
      ),
    ));
    return BlocProvider<GetOrderListCubit>(
      create: (context) {
        return GetOrderListCubit(
          failureHandlerManager: context.read(),
          orderController: context.read(),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).checkOrderDeliveryDetails,
            style: Styles.s15()
                .withWeight(FontWeight.w600)
                .withLetterSpacing(-2.5 / 100),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              const DeliveryStatusFilter(),
              const SizedBox(height: 24),
              BlocBuilder<GetOrderListCubit, GetOrderListState>(
                  builder: (context, state) {
                return Expanded(
                  child: InfiniteLoaderWrapper<GetOrderListCubit,
                          GetOrderListState>.value(
                      value: context.read<GetOrderListCubit>(),
                      builder: (BuildContext context,
                          ScrollController controller,
                          GetOrderListState state) {
                        final helper = InfiniteLoaderCalculatorHelper(state);
                        if (helper.firstLoadInProgress) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return shimmerItem;
                            },
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const ItemDivider(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 18)),
                            itemCount: 5,
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<GetOrderListCubit>().reload();
                          },
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              if (helper.firstLoadError) {
                                return helper.fullPageScrollable(
                                    context, constraints, builder: (context) {
                                  return TextCenter(
                                      title: S.of(context).someError);
                                });
                              }
                              if (helper.emptyResult) {
                                return helper.fullPageScrollable(
                                  context,
                                  constraints,
                                  builder: (context) {
                                    return TextCenter(
                                        title: S.of(context).emptyList);
                                  },
                                );
                              }

                              return ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: helper.length,
                                controller: controller,
                                separatorBuilder: (context, index) =>
                                    const ItemDivider(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 18)),
                                itemBuilder: (context, index) {
                                  return helper.renderItem(
                                    context,
                                    index,
                                    loadingItemBuilder: (context) {
                                      return shimmerItem;
                                    },
                                    errorItemBuilder: (context) {
                                      return const InfiniteLoadingListItemError();
                                    },
                                    itemBuilder: (context) {
                                      final data = state.data[index];

                                      final productList = _getProductList(
                                          data.orderDetailResponses);
                                      final canCancel = data.orderStatus ==
                                              OrderStatusType.unconfirmed ||
                                          data.orderStatus ==
                                              OrderStatusType.confirmed;

                                      final canViewDeliveryStatus =
                                          data.orderStatus ==
                                                  OrderStatusType.delivering ||
                                              data.orderStatus ==
                                                  OrderStatusType.delivered;

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: OrderItem(
                                          date: data.createdAt,
                                          status: data.orderStatus,
                                          productName: resolveFieldValueName(
                                              context, productList.first.title),
                                          productImage: productList
                                              .first.images?.first.previewUrl,
                                          onInquire: () async {
                                            final checked =
                                                await ProductListSheetRouteData(
                                                            $extra:
                                                                data.orderDetailResponses ??
                                                                    [])
                                                        .push<bool>(context) ??
                                                    false;
                                            if (context.mounted && checked) {
                                              context
                                                  .read<GetOrderListCubit>()
                                                  .reload();
                                            }
                                          },
                                          onDeliveryCheck:
                                              !canViewDeliveryStatus
                                                  ? null
                                                  : () {
                                                      if (data.courierId !=
                                                              null &&
                                                          data.trackingId !=
                                                              null) {
                                                        DeliveryStatusRouteData(
                                                                courierId:
                                                                    data.courierId ??
                                                                        '',
                                                                trackingId:
                                                                    data.trackingId ??
                                                                        '',
                                                                $extra:
                                                                    data.courierName ??
                                                                        '')
                                                            .push(context);
                                                      } else {
                                                        AlertRouteData(
                                                                content: S
                                                                    .of(context)
                                                                    .deliveryInformationHasNotBeenUpdated)
                                                            .push(context);
                                                      }
                                                    },
                                          onCancel: canCancel
                                              ? () async {
                                                  if (data.id != null) {
                                                    final agreed =
                                                        await ConfirmRouteData(
                                                                content: S
                                                                    .of(context)
                                                                    .areYouSureYouWantToCancelThisOrder)
                                                            .push<bool>(
                                                                context);

                                                    if (agreed == null) {
                                                      return;
                                                    }
                                                    if (agreed == true &&
                                                        context.mounted) {
                                                      context
                                                          .read<
                                                              GetOrderListCubit>()
                                                          .cancelOrder(
                                                              data.id!);
                                                    }
                                                  }
                                                }
                                              : null,
                                          onViewDetail: () {
                                            if (data.id != null) {
                                              OldOrderDetailsRouteData(
                                                      orderId: data.id!)
                                                  .push(context);
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  List<ProductResponse> _getProductList(
      List<OrderDetailResponse>? dataOrderSession) {
    final List<ProductResponse> productResponse = [];
    for (final OrderDetailResponse order in dataOrderSession ?? []) {
      if (order.productResponse != null) {
        productResponse.add(order.productResponse!);
      }
    }
    return productResponse;
  }
}
