import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/user_order_session/user_order_session.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/cart_cubit/cart_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../order_detail_screen/blocs/order_session_cubit.dart';
import '../order_detail_screen/blocs/order_session_detail_state.dart';
import 'widgets/cart_list.dart';
import 'widgets/cost_title.dart';
import 'widgets/items_quick_management_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartCubit _cartCubit;

  @override
  void initState() {
    super.initState();
    _cartCubit = context.read<CartCubit>();
    _cartCubit.reload();
  }

  @override
  void dispose() {
    // _cartCubit.reload();
    _cartCubit.resetCart();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(S.of(context).shoppingCart),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final int totalItemsRemain =
                  state.totalItems - state.data.length + state.totalItemsShow;
              final bool allSelected = state.selectedAll ||
                  state.selectedProducts.length == totalItemsRemain;
              return ItemQuickManagementSection(
                allSelected: allSelected,
                onDelete: () {
                  if (state.selectedAll) {
                    context.read<CartCubit>().onDeleteAllCart();
                  } else {
                    context.read<CartCubit>().onDeleteCartSelected();
                  }
                },
                onSelectAllChanged: (value) {
                  context.read<CartCubit>().onSelectionAllChanged(value);
                },
                currentAmount: state.totalItemsShow,
              );
            },
          ),
          const Expanded(child: CartList()),
          Container(
            height: 4,
            color: AppColors.gray.shade100,
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final totalPrice = context.read<CartCubit>().getPriceTotal();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CostTile(
                          price: totalPrice,
                          titleStyle: Styles.s15()
                              .withWeight(FontWeight.w500)
                              .withColor(AppColors.text.main)
                              .withLetterSpacing(-2.5 / 100),
                          priceStyle: Styles.s20()
                              .withWeight(FontWeight.w600)
                              .withColor(AppColors.text.main)
                              .withLetterSpacing(-2.5 / 100),
                          title: S.of(context).paymentAmount,
                        ),
                      ],
                    ),
                  ),
                  BlocProvider<OrderSessionCubit>(
                    create: (context) {
                      return OrderSessionCubit(
                        isFetching: false,
                        failureHandlerManager:
                            context.read<FailureHandlerManager>(),
                        loadingManager: context.read<LoadingManager>(),
                        orderSessionController:
                            context.read<UserOrderSessionController>(),
                      );
                    },
                    child: Builder(builder: (context) {
                      return BlocListener<OrderSessionCubit, OrderSessionState>(
                        listener: (context, state) async {
                          if (state.apiPostStatus == ApiStatus.success) {
                            await const NewOrderDetailsRouteData()
                                .push(context);
                            if (!context.mounted) {
                              return;
                            }
                            context
                                .read<OrderSessionCubit>()
                                .resetApiPostStatus();
                          }
                        },
                        child: Builder(builder: (context) {
                          return BottomButton(
                            title: S.of(context).totalPrice(
                                S.of(context).commonCurrencyFormat(totalPrice),
                                state.selectedProducts.length),
                            enableBorder: true,
                            onPress: state.selectedProducts.isEmpty
                                ? null
                                : () {
                                    final orderDetails = state
                                        .selectedProducts.values
                                        .map(
                                          (e) =>
                                              OrderDetailsSessionCreateRequest(
                                            currentPrice: e.cartResponse.product
                                                    ?.currentPrice ??
                                                0,
                                            productId:
                                                e.cartResponse.product?.id ?? 0,
                                            quantity: e.quantity,
                                          ),
                                        )
                                        .toList();
                                    context
                                        .read<OrderSessionCubit>()
                                        .createOrderSession(
                                            orderDetailsSessionCreateRequests:
                                                orderDetails);
                                  },
                          );
                        }),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
