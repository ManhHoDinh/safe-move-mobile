import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../theme/theme.dart';
import '../buttons/app_outlined_button.dart';

class LoginRequiredNotificationContent extends StatelessWidget {
  const LoginRequiredNotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).youNeedToLoginToAccessThisContent,
              textAlign: TextAlign.center,
              style: Styles.s13().withColor(AppColors.blue.shade500),
            ),
            const SizedBox(height: 10),
            AppOutlinedButton.square(
              wrapContent: true,
              onPressed: () {
                const ProfileLoginRouteData().push(context);
              },
              title: S.of(context).goToLoginPage,
            ),
          ],
        ),
      ),
    );
  }
}
