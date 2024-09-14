import 'package:flutter/material.dart';

import '../../router/router_config/router_config.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/success_section.dart';

class PaymentFailedScreen extends StatelessWidget {
  const PaymentFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: const CommonAppBar(
          automaticallyImplyLeading: false,
        ),
        body: SuccessFailedStatusSection(
          success: false,
          content: '결제에 실패했습니다.\n다시 시도해 주세요.',
          onPress: () {
            const StoreRouteData().go(context);
          },
        ),
      ),
    );
  }
}
