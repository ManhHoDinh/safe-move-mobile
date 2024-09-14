import 'package:flutter/material.dart';

import '../../application/services/term_and_condition/term_and_condition.dart';

String resolveTermContent(
    BuildContext context, TermAndCondResponse? termAndCondResponse) {
  String? result;

  switch (Localizations.localeOf(context).languageCode) {
    case 'en':
      result = termAndCondResponse?.contentEn;
    case 'zh':
      result = termAndCondResponse?.contentCn;
    case 'ja':
      result = termAndCondResponse?.contentJp;
    case 'ko':
      result = termAndCondResponse?.contentKr;
  }
  return result ?? '';
}
