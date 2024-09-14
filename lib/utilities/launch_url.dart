import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../presentation/gen/locale/app_localizations.dart';
import '../presentation/shared/widgets/snack_bar/app_snack_bar.dart';

Future<void> appLaunchUrl(String url, BuildContext context) async {
  final Uri launch = Uri.parse(url);

  final checked = await launchUrl(launch, mode: LaunchMode.externalApplication);

  if (!checked) {
    if (context.mounted) {
      final AppSnackBar snackBar =
          AppSnackBar(title: S.of(context).couldNotLunch(url));
      snackBar.showSnackBar(context);
    }
  }
}

Future<void> appCallPhone(String phone, BuildContext context) async {
  final Uri launch = Uri.parse('tel:$phone');

  final checked = await launchUrl(launch);

  if (!checked) {
    if (context.mounted) {
      final AppSnackBar snackBar =
          AppSnackBar(title: S.of(context).couldNotLunch(phone));
      snackBar.showSnackBar(context);
    }
  }
}
