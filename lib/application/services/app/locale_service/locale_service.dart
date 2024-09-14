import 'dart:async';
import 'dart:ui';

import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';

abstract class LocaleService {
  Future<Result<Failure, Locale?>> loadLocale();

  Future<Result<Failure, void>> saveLocale(Locale locale);
}
