import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../gen/locale/app_localizations.dart';

String formatDate(DateTime dateTime) {
  return DateFormat('yyyy.MM.dd').format(dateTime);
}

String diffDate(DateTime dateTime, BuildContext context) {
  final DateTime localTime = DateTime.parse('${dateTime}Z').toLocal();
  final DateTime currentTime = DateTime.now();
  final Duration difference = currentTime.difference(localTime);

  if (difference.inDays > 0) {
    return DateFormat('yyyy.MM.dd').format(dateTime);
  } else if (difference.inHours > 0) {
    return S.of(context).hoursAgo(difference.inHours.toString());
  } else if (difference.inMinutes > 0) {
    return S.of(context).minutesAgo(difference.inMinutes.toString());
  } else {
    return S.of(context).justNow;
  }
}
