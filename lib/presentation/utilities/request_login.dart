import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bases/auth_cubit/auth_cubit.dart';
import '../gen/locale/app_localizations.dart';
import '../router/router_config/router_config.dart';

Future<bool> requestLoginAction(
  BuildContext context, {
  String? requestTitle,
}) async {
  final authCubit = context.read<AuthCubit>();
  final isLoggedIn = authCubit.state is AuthStatusLoggedInState;
  if (isLoggedIn) {
    return true;
  }
  final bool checked = await ConfirmRouteData(
        content: requestTitle ??
            S.of(context).pleaseLoginToViewRegisteredInformation,
        acceptTitle: S.of(context).ok,
        rejectTitle: S.of(context).cancel,
      ).push<bool>(context) ??
      false;

  if (!context.mounted || !checked) {
    return false;
  }

  final bool isSuccessLogin =
      await const HomeLoginRouteData().push<bool>(context) ?? false;
  return isSuccessLogin;
}
