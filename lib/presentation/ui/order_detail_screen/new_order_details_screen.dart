import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/user_order_session/user_order_session.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_switches/app_checkbox_title.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../../shared/widgets/item_divider.dart';
import '../address_managent_screen/address_management_screen.dart';
import '../cart_screen/widgets/cost_title.dart';
import 'blocs/order_session_cubit.dart';
import 'blocs/order_session_detail_state.dart';
import 'widgets/orderer_info_section.dart';
import 'widgets/product_list.dart';
import 'widgets/shipping_info_section.dart';

class NewOrderDetailsScreen extends StatelessWidget {
  const NewOrderDetailsScreen({super.key});

  String? renderDiscountFieldError(
      BuildContext context, DiscountFieldError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case DiscountFieldError.discountInvalid:
        return S.of(context).dicountInvalid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderSessionCubit>(
          create: (context) {
            return OrderSessionCubit(
              orderSessionController:
                  context.read<UserOrderSessionController>(),
              failureHandlerManager: context.read<FailureHandlerManager>(),
              loadingManager: context.read<LoadingManager>(),
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).orderPayment,
            style: Styles.s15()
                .withLetterSpacing(-2.5 / 100)
                .withWeight(FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<OrderSessionCubit, OrderSessionState>(
            builder: (context, state) {
          final dataOrderSession = state.orderSessionResponse;

          return AppShimmer(
            enabled: state.loading,
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<OrderSessionCubit>().reload();
                    },
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 8, bottom: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: OrdererInfoSection(
                              sectionTitle: S.of(context).orderer,
                              ordererName: dataOrderSession?.user?.name,
                              phoneNumber:
                                  state.orderSessionResponse?.user?.phoneNumber,
                              email: dataOrderSession?.user?.email,
                              loading: state.loading,
                            ),
                          ),
                          const ItemDivider(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              thickness: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: ShippingInfoSection(
                              defaultAddress:
                                  dataOrderSession?.isDefaultAddress ?? false,
                              onChangeAddress: () async {
                                final addressId = await AddressRouteData(
                                  addressType: AddressType.selection,
                                  addressId: dataOrderSession?.address?.id,
                                ).push<int>(context);

                                if (!context.mounted) {
                                  return;
                                }
                                if (addressId != null &&
                                    dataOrderSession
                                            ?.orderDetailSessionResponse !=
                                        null) {
                                  final orderDetails =
                                      _getOrderQuery(dataOrderSession!);
                                  await context
                                      .read<OrderSessionCubit>()
                                      .createOrderSession(
                                          addressId: addressId,
                                          discountPrice: state.discountField
                                                  .value.isNotEmpty
                                              ? double.parse(
                                                  state.discountField.value)
                                              : null,
                                          orderDetailsSessionCreateRequests:
                                              orderDetails);
                                  if (!context.mounted) {
                                    return;
                                  }
                                  context.read<OrderSessionCubit>().reload();
                                }
                              },
                              title: state
                                  .orderSessionResponse?.address?.mainAddress,
                              content: dataOrderSession?.address?.detailAddress,
                              phone: dataOrderSession?.phoneNumber,
                              name: dataOrderSession?.name,
                            ),
                          ),
                          const ItemDivider(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              thickness: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
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
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              child: ProductList()),
                          const ItemDivider(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              thickness: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              children: [
                                CostTile(
                                  price: dataOrderSession?.productsPrice ?? 0,
                                  title: S.of(context).totalProductAmount,
                                ),
                                const SizedBox(height: 8),
                                CostTile(
                                  price: dataOrderSession?.shippingFee ?? 0,
                                  pricePrefix: '+ ',
                                  title: S.of(context).deliveryFee,
                                ),
                                // const SizedBox(height: 8),
                                // CostTile(
                                //   price: dataOrderSession?.discountPrice ?? 0,
                                //   pricePrefix: '- ',
                                //   title: S.of(context).totalDiscountAmount,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 16),
                                //   child: ButtonTextField(
                                //     buttonTitle: S.of(context).apply,
                                //     keyboardType: TextInputType.number,
                                //     useClearIcon: false,
                                //     initialValue: state.discountField.value,
                                //     inputFormatters: [MinMaxFormatter(0)],
                                //     onChanged: (value) {
                                //       context
                                //           .read<OrderSessionCubit>()
                                //           .setDiscountPrice(value);
                                //     },
                                //     enableButton: state.discountField.isValid &&
                                //         state.discountField.value.isNotEmpty,
                                //     onSubmit: (value) async {
                                //       final orderDetail =
                                //           _getOrderQuery(dataOrderSession!);
                                //       await context
                                //           .read<OrderSessionCubit>()
                                //           .createOrderSession(
                                //               orderDetailsSessionCreateRequests:
                                //                   orderDetail,
                                //               addressId:
                                //                   dataOrderSession.address?.id,
                                //               discountPrice:
                                //                   double.parse(value));
                                //     },
                                //     errorText: renderDiscountFieldError(context,
                                //         state.discountField.displayError),
                                //   ),
                                // ),
                                const SizedBox(height: 16),
                                CostTile(
                                  price: dataOrderSession?.totalPrice ?? 0,
                                  titleStyle: Styles.s15()
                                      .withWeight(FontWeight.w500)
                                      .withColor(AppColors.text.main)
                                      .withLetterSpacing(-2.5 / 100),
                                  priceStyle: Styles.s20()
                                      .withWeight(FontWeight.w600)
                                      .withColor(AppColors.blue.shade500)
                                      .withLetterSpacing(-2.5 / 100),
                                  title: S.of(context).paymentAmount,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18, right: 8, top: 8, bottom: 16),
                      child: AppCheckBoxTitle(
                        value: state.checkBoxValue,
                        onChanged: (value) {
                          context
                              .read<OrderSessionCubit>()
                              .setCheckboxValue(value);
                        },
                        title: Text(S.of(context).orderProductAgree),
                      ),
                    ),
                    BottomButton(
                      enableBorder: true,
                      onPress: state.checkBoxValue &&
                              dataOrderSession?.address != null
                          ? () {
                              PaymentRouteData(
                                      amount: dataOrderSession?.totalPrice ?? 0,
                                      orderSessionId: dataOrderSession?.id ?? 1)
                                  .push(context);
                            }
                          : null,
                      title: S.of(context).totalPriceWithoutNumber(
                          dataOrderSession?.totalPrice ?? 0),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  List<OrderDetailsSessionCreateRequest> _getOrderQuery(
      OrderSessionResponse dataOrderSession) {
    return dataOrderSession.orderDetailSessionResponse!
        .map(
          (e) => OrderDetailsSessionCreateRequest(
            currentPrice: e.productResponse?.currentPrice ?? 0,
            productId: e.productResponse?.id ?? 0,
            quantity: e.quantity ?? 0,
          ),
        )
        .toList();
  }
}
