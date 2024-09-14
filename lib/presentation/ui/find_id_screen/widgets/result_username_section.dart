import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class ResultUsernameSection extends StatelessWidget {
  const ResultUsernameSection({
    super.key,
    required this.phoneNumber,
    required this.username,
  });

  final String phoneNumber;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 72, bottom: 16, left: 18, right: 18),
      child: Column(
        children: <Widget>[
          SelectableText(
            S.of(context).usernameOfPhoneNumber(phoneNumber),
            style: Styles.s20()
                .withWeight(FontWeight.w600)
                .withLetterSpacing(-5 / 100)
                .withColor(AppColors.gray.shade800),
          ),
          RichText(
            text: TextSpan(
              text: username,
              style: Styles.s20()
                  .withWeight(FontWeight.w600)
                  .withLetterSpacing(-5 / 100)
                  .withColor(AppColors.blue.shade500),
              children: <TextSpan>[
                TextSpan(
                    text: ' ${S.of(context).id}',
                    style: Styles.s20()
                        .withWeight(FontWeight.w600)
                        .withLetterSpacing(-5 / 100)
                        .withColor(AppColors.gray.shade800)),
              ],
            ),
          ),
          const Spacer(),
          AppOutlinedButton.square(
              onPressed: () {
                const ResetPasswordRouteData().push(context);
              },
              title: S.of(context).resetPassword),
          const SizedBox(height: 12),
          PrimaryButton.square(
            onPressed: () {
              context.pop();
            },
            title: S.of(context).signIn,
          )
        ],
      ),
    );
  }
}
