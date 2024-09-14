import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../di/di.dart';
import 'bases/global_key_provider/global_key_provider.dart';
import 'bases/go_router/go_router.dart';
import 'bases/locale_cubit/locale_cubit.dart';
import 'gen/locale/app_localizations.dart';
import 'injects/bloc_inject/bloc_inject.dart';
import 'injects/di_data_inject/di_data_inject.dart';
import 'injects/service_inject/service_inject.dart';
import 'router/app_nav_key/app_nav_key.dart';
import 'router/router_config/router_config.dart';
import 'shared/handlers/assets_loader_handler/assets_loader_handler.dart';
import 'shared/handlers/auth_based_routing_handler/auth_based_routing_handler.dart';
import 'shared/handlers/deeplink/app_deeplink_handler.dart';
import 'shared/handlers/failure_handler/failure_handler.dart';
import 'shared/handlers/loading_handler/loading_handler.dart';
import 'shared/handlers/loading_handler/one_signal_handler.dart';
import 'shared/status_bar_height_provider/status_bar_height_provider.dart';
import 'shared/theme/theme.dart';

class SuccessManiaApp extends StatelessWidget {
  const SuccessManiaApp({
    super.key,
    required this.data,
  });

  final AppDIData data;

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        DIDataInject(data: data),
      ],
      child: GlobalKeyProviderWrapper<NavigatorState>(
        globalKey: AppNavKey.root,
        children: const [
          LoadingHandler(),
          FailureHandler(),
          ServiceInject(),
          BlocInject(),
          AuthBasedRoutingHandler(),
          AppDeeplinkHandler(),
          StatusBarHeightProvider(),
          AssetsLoaderHandler(),
          OneSignalHandler(),
          AppRoutingConfig(),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'SUCCESS MANIA',
              debugShowCheckedModeBanner: false,
              locale: context.watch<LocaleCubit>().state,
              localizationsDelegates: S.localizationsDelegates,
              localeListResolutionCallback: (locales, supportedLocales) {
                for (final Locale locale in locales ?? []) {
                  if (supportedLocales.contains(locale)) {
                    return locale;
                  }
                }
                return supportedLocales.first;
              },
              supportedLocales: S.supportedLocales,
              theme: AppTheme.lightTheme,
              themeMode: AppTheme.defaultTheme,
              routerConfig: GoRouterConfig.of(context),
            );
          },
        ),
      ),
    );
  }
}
