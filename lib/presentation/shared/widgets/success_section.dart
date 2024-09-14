import 'package:flutter/cupertino.dart';

import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../theme/src/app_style.dart';
import 'buttons/bottom_button.dart';

class SuccessFailedStatusSection extends StatelessWidget {
  const SuccessFailedStatusSection({
    super.key,
    required this.content,
    this.onPress,
    this.success = true,
  });

  final bool success;

  final String content;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (success)
                  Assets.svgs.checkIcon.svg()
                else
                  Assets.svgs.failedIcon.svg(),
                const SizedBox(height: 24),
                Text(
                  content,
                  style: Styles.s20()
                      .withWeight(FontWeight.w600)
                      .withLetterSpacing(-5 / 100)
                      .withColor(AppColors.text.main),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )),
        if (success)
          BottomButton(
            onPress: onPress,
            title: S.of(context).ok,
          )
        else
          BottomButton(
            onPress: onPress,
            title: S.of(context).check,
          )
      ],
    );
  }
}
