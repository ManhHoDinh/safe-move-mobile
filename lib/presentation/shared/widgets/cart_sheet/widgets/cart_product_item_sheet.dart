import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../application/services/user_cart/user_cart.dart';
import '../../../../../application/services/user_order_session/user_order_session.dart';
import '../../../../../utilities/api_status/api_status.dart';
import '../../../../gen/app_colors.dart';
import '../../../../gen/locale/app_localizations.dart';
import '../../../../router/router_config/router_config.dart';
import '../../../../shared/theme/src/app_style.dart';
import '../../../../ui/cart_screen/widgets/product_item_counter.dart';
import '../../../../ui/order_detail_screen/blocs/order_session_cubit.dart';
import '../../../../ui/order_detail_screen/blocs/order_session_detail_state.dart';
import '../../../base_infinite_loading/image_loading.dart';
import '../../../handlers/failure_handler/failure_handler_manager.dart';
import '../../../handlers/loading_handler/loading_manager.dart';
import '../../buttons/bottom_button.dart';
import '../blocs/cart_sheet_cubit.dart';
import '../blocs/cart_sheet_state.dart';
import '../cart_sheet.dart';

class CartProductItemSheet extends StatefulWidget {
  const CartProductItemSheet({
    super.key,
    this.imageUrl,
    required this.title,
    required this.pricePerUnit,
    required this.productId,
    required this.actionType,
  });

  final String? imageUrl;
  final String title;
  final double pricePerUnit;
  final int productId;
  final ProductActionType actionType;

  @override
  State<CartProductItemSheet> createState() => _CartProductItemSheetState();
}

class _CartProductItemSheetState extends State<CartProductItemSheet> {
  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const helperImage = ImageLoading(
      width: 64,
      height: 64,
    );
    return BlocProvider<CartSheetCubit>(
      create: (BuildContext context) {
        return CartSheetCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          productId: widget.productId,
          userCartController: context.read<UserCartController>(),
          initialPrice: widget.pricePerUnit,
          loadingManager: context.read<LoadingManager>(),
        );
      },
      child: BlocListener<CartSheetCubit, CartSheetState>(
        listener: (context, state) {
          if (!context.mounted) {
            return;
          }
          if (state.isSuccess) {
            context.pop(widgetKey);
          }
        },
        child: BlocBuilder<CartSheetCubit, CartSheetState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          key: widgetKey,
                          width: 64,
                          height: 64,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: AppColors.gray.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: widget.imageUrl != null
                              ? Image.network(
                                  fit: BoxFit.cover,
                                  widget.imageUrl!,
                                  loadingBuilder: helperImage.loadingBuilder,
                                  errorBuilder: helperImage.errorBuilder,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2)
                                  .copyWith(top: 12),
                              child: Text(
                                widget.title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.s13()
                                    .withLetterSpacing(-2.5 / 100)
                                    .withColor(AppColors.text.main),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  S.of(context).commonCurrencyFormat(
                                      widget.pricePerUnit),
                                  style: Styles.s15()
                                      .withWeight(FontWeight.w500)
                                      .withLetterSpacing(-2.5 / 100)
                                      .withColor(AppColors.text.main),
                                ),
                                const Spacer(),
                                ProductItemCounter(
                                    count: state.quantity,
                                    onAdd: () {
                                      context
                                          .read<CartSheetCubit>()
                                          .onAddQuantity();
                                    },
                                    onSubtract: () {
                                      context
                                          .read<CartSheetCubit>()
                                          .onSubtractQuantity();
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          S.of(context).commonCurrencyFormat(state.price),
                          style: Styles.s20()
                              .withWeight(FontWeight.w500)
                              .withLetterSpacing(-2.5 / 100)
                              .withColor(AppColors.blue.shade500),
                        ),
                      )),
                  const SizedBox(
                    height: 50,
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
                    child: BlocListener<OrderSessionCubit, OrderSessionState>(
                      listener: (context, state) {
                        if (state.apiPostStatus == ApiStatus.success) {
                          const NewOrderDetailsRouteData().push(context);
                        }
                      },
                      child: Builder(builder: (context) {
                        return BottomButton(
                          title:
                              widget.actionType == ProductActionType.addToCart
                                  ? S.of(context).addToCart
                                  : S.of(context).buyNow,
                          enableBorder: true,
                          padding: EdgeInsets.zero,
                          onPress: () {
                            if (widget.actionType ==
                                ProductActionType.addToCart) {
                              context.read<CartSheetCubit>().onAddToCart();
                            } else {
                              context
                                  .read<OrderSessionCubit>()
                                  .createOrderSession(
                                      orderDetailsSessionCreateRequests: [
                                    OrderDetailsSessionCreateRequest(
                                        productId: widget.productId,
                                        currentPrice: widget.pricePerUnit,
                                        quantity: state.quantity)
                                  ]);
                            }
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
