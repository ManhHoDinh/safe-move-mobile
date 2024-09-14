import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../application/failures/persistent/persistent.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../../application/services/app/locale_service/locale_service.dart';

class LocaleServiceImpl implements LocaleService {
  const LocaleServiceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  static const localeKey = 'sm-locale';

  @override
  Future<Result<Failure, Locale?>> loadLocale() async {
    final languageCode = sharedPreferences.getString(localeKey);
    if (languageCode == null) {
      return const Right(null);
    }
    return Right(Locale(languageCode));
  }

  @override
  Future<Result<Failure, void>> saveLocale(Locale locale) async {
    try {
      await sharedPreferences.setString(localeKey, locale.languageCode);
      return const Right(null);
    } catch (error) {
      return const Left(PersistentWriteFailure());
    }
  }
}
