import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../application/services/app/app_config/app_config.dart';

Future<bool?> shareLink(String url, BuildContext context, String title) async {
  final AppConfig appConfig = context.read<AppConfig>();

  final result =
      await Share.shareWithResult(appConfig.appLink + url, subject: title);

  if (result.status == ShareResultStatus.success) {
    return true;
  }

  return false;
}
