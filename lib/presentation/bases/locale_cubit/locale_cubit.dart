import 'package:flutter/material.dart';

import '../../../application/services/app/locale_service/locale_service.dart';
import '../bloc_utils/safe_cubit/safe_cubit.dart';

class LocaleCubit extends SafeCubit<Locale> {
  LocaleCubit({
    required this.localeService,
  }) : super(defaultLocale);

  final LocaleService localeService;

  static const defaultLocale = Locale('ko');

  void bootstrapCompleted(Locale? locale) {
    emit(locale ?? defaultLocale);
  }

  void changeLocale(Locale locale) async {
    emit(locale);
    await localeService.saveLocale(locale);
  }
}
