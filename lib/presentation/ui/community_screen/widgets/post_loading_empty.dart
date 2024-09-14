import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/buttons/app_outlined_button.dart';

class PostLoadingEmpty extends StatelessWidget {
  const PostLoadingEmpty(
      {super.key, this.showNavigationButton = false, this.textEmpty});

  final bool showNavigationButton;
  final String? textEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textEmpty ?? S.of(context).noPost,
              textAlign: TextAlign.center,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100)
                  .withColor(AppColors.text.common),
            ),
            if (showNavigationButton)
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: AppOutlinedButton.square(
                  onPressed: () {
                    const CommunityRouteData().go(context);
                  },
                  title: S.of(context).exploreOurCommunity,
                  wrapContent: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 27),
                  borderRadius: BorderRadius.circular(4),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
