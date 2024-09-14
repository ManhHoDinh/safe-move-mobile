import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bases/cart_cubit/cart_cubit.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/success_section.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({
    super.key,
    required this.success,
  });

  final bool success;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const CommonAppBar(
          automaticallyImplyLeading: false,
        ),
        body: SuccessFailedStatusSection(
          content: success
              ? S.of(context).paymentSuccessMessage
              : S.of(context).paymentFailedMessage,
          success: success,
          onPress: () {
            if (success) {
              context.read<CartCubit>().reload();
            }
            const StoreRouteData().go(context);
          },
        ),
      ),
    );
  }
}
