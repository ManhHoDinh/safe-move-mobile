import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';
import 'package:uuid/uuid.dart';

import '../../../application/services/app/app_config/app_config.dart';
import '../../../application/services/user_order/user_order.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import 'blocs/payment_cubit.dart';
import 'blocs/payment_state.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key, required this.amount, required this.orderSessionId});

  final double amount;
  final int orderSessionId;

  @override
  State<PaymentScreen> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentWidget _paymentWidget;
  bool loading = true;
  var uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    final AppConfig appConfig = context.read<AppConfig>();

    _paymentWidget = PaymentWidget(
      clientKey: appConfig.clientTossKey,
      customerKey: uuid.v1(),
    );

    _paymentWidget.renderPaymentMethods(
        selector: 'methods',
        amount: Amount(value: widget.amount),
        options: RenderPaymentMethodsOptions(variantKey: 'DEFAULT'));

    _paymentWidget.renderAgreement(selector: 'agreement');
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      lazy: false,
      create: (context) => PaymentCubit(
        userOrderController: context.read<UserOrderController>(),
        failureHandlerManager: context.read<FailureHandlerManager>(),
        amount: widget.amount,
        orderSessionId: widget.orderSessionId,
      ),
      child: Builder(builder: (context) {
        return BlocListener<PaymentCubit, PaymentState>(
          listenWhen: (prev, curr) {
            return prev.paymentSuccess != curr.paymentSuccess;
          },
          listener: (BuildContext context, PaymentState state) async {
            if (state.paymentSuccess != null && context.mounted) {
              if (state.paymentSuccess!) {
                const PaymentSuccessRouteData().go(context);
              } else {
                const PaymentFailedRouteData().go(context);
              }
            }
          },
          child: loading
              ? const CircularProgressIndicator()
              : Scaffold(
                  appBar: CommonAppBar(
                    title: Text(
                      S.of(context).payment,
                      style: Styles.s15()
                          .withLetterSpacing(-2.5 / 100)
                          .withWeight(FontWeight.w500),
                    ),
                    centerTitle: true,
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              PaymentMethodWidget(
                                paymentWidget: _paymentWidget,
                                selector: 'methods',
                              ),
                              AgreementWidget(
                                paymentWidget: _paymentWidget,
                                selector: 'agreement',
                              ),
                              BottomButton(
                                onPress: () async {
                                  final paymentResult =
                                      await _paymentWidget.requestPayment(
                                          paymentInfo: PaymentInfo(
                                              orderId: uuid.v4(),
                                              orderName: '지불 주문'));
                                  if (!context.mounted) {
                                    return;
                                  }
                                  if (paymentResult.success != null) {
                                    if (!context.mounted) {
                                      return;
                                    }
                                    context.read<PaymentCubit>().confirmPayment(
                                        paymentResult.success?.paymentKey ?? '',
                                        paymentResult.success?.orderId ?? '');
                                  } else if (paymentResult.fail != null) {
                                    const PaymentFailedRouteData().go(context);
                                  }
                                },
                                title: '결제하기',
                              ),

                              // ElevatedButton(
                              //     onPressed: () async {
                              //       final agreementStatus = await _agreementWidgetControl?.getAgreementStatus();
                              //       print('${agreementStatus?.agreedRequiredTerms}');
                              //     },
                              //     child: const Text('약관 동의 상태 출력')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
