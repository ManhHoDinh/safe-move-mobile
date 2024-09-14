import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bases/auth_cubit/auth_cubit.dart';
import '../../bases/locale_cubit/locale_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/drop_down_bar/drop_down_bar.dart';
import '../../utilities/request_login.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  String renderLocale(BuildContext context, Locale locale) {
    switch (locale.languageCode) {
      case 'ko':
        return '한국어';
      case 'en':
        return 'English';
      case 'ja':
        return '日本語';
      case 'zh':
        return '中 国人';
    }
    return '한국어';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          S.of(context).setting,
          style: Styles.s15()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.main),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _ItemSetting(
            title: S.of(context).accountInformationManagement,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const AccountInformationManagementRouteData().go(context);
              }
            },
          ),
          _ItemSetting(
            title: S.of(context).notificationSettings,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const NotificationSettingRouteData().go(context);
              }
            },
          ),
          _ItemSetting(
            title: S.of(context).languageSettings,
            onTap: () async {
              final returnData = await const DropdownSheetRouteData(
                $extra: [
                  DropDownBarData(
                    value: Locale('ko'),
                    title: '한국어',
                  ),
                  DropDownBarData(
                    value: Locale('en'),
                    title: 'English',
                  ),
                  DropDownBarData(
                    value: Locale('ja'),
                    title: '日本語',
                  ),
                  DropDownBarData(
                    value: Locale('zh'),
                    title: '中国人',
                  ),
                ],
              ).push<Locale>(context);
              if (returnData == null || !context.mounted) {
                return;
              }
              context.read<LocaleCubit>().changeLocale(returnData);
            },
            rightTitle:
                renderLocale(context, context.watch<LocaleCubit>().state),
          ),
          _ItemSetting(
            title: S.of(context).usagePolicy,
            onTap: () {
              const PolicyAndTermConditionsRouteData().push(context);
            },
          ),
          _ItemSetting(
            title: S.of(context).logout,
            onTap: () async {
              await context
                  .read<LoadingManager>()
                  .startLoading(future: context.read<AuthCubit>().logout());

              if (!context.mounted) {
                return;
              }
              final router = GoRouter.of(context);
              router.go(const HomeRouteData().location);
            },
          )
        ],
      ),
    );
  }
}

class _ItemSetting extends StatelessWidget {
  const _ItemSetting({required this.title, this.onTap, this.rightTitle});

  final String title;
  final VoidCallback? onTap;
  final String? rightTitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.s15()
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main),
              ),
              Text(
                rightTitle ?? '',
                style: Styles.s13()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.blue.shade500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
