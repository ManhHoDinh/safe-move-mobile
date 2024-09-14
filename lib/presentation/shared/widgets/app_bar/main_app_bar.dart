import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../router/router_config/router_config.dart';
import '../../../utilities/request_login.dart';
import '../app_icon_button.dart';
import 'common_app_bar_template.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.onLogoTap,
    this.height = 66,
  });

  final VoidCallback? onLogoTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CommonAppBarTemplate(
      iconBrightness: Brightness.light,
      color: AppColors.blue.shade600,
      title: GestureDetector(
        onTap: onLogoTap,
        child: FittedBox(
          child: SizedBox(
            width: 83.67,
            height: 28,
            child: Assets.svgs.logo.svg(),
          ),
        ),
      ),
      actions: [
        AppIconButton(
          onTap: () async {
            final isLoggedIn = await requestLoginAction(context);
            if (!context.mounted) {
              return;
            }
            if (isLoggedIn) {
              const NotificationRouteData().push(context);
            }
          },
          icon: Assets.svgs.appBarBellIcon.svg(),
        ),
        AppIconButton(
          onTap: () {
            const DrawerRouteData().go(context);
          },
          icon: Assets.svgs.drawerMenu.svg(),
        ),
      ],
      height: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
