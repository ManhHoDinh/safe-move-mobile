import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../application/failures/generic/generic_failure.dart';
import '../../../application/services/app/app_config/app_config.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';

class AppConfigLoaderImpl with AppConfigLoader {
  const AppConfigLoaderImpl();

  @override
  Future<Result<Failure, AppConfig>> loadConfig() async {
    try {
      String envFileName = '.env';
      if (kReleaseMode) {
        envFileName = '.env.release';
      }
      await dotenv.load(fileName: envFileName);
      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version;
      final resolvedVersion = 'v$version';

      final appVariable = AppConfig(
        kakaoNativeAppKey: dotenv.env['KAKAO_NATIVE_APP_KEY'] ?? '',
        version: resolvedVersion,
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        youtubePlayListId: dotenv.env['YOUTUBE_PLAYLIST_ID'] ?? '',
        youtubeApiKey: dotenv.env['YOUTUBE_API_KEY'] ?? '',
        clientTossKey: dotenv.env['CLIENT_KEY_TOSS'] ?? '',
        oneSignalAppId: dotenv.env['ONE_SIGNAL_APP_ID'] ?? '',
        appLink: dotenv.env['APP_LINK'] ?? '',
        sweettrackerBaseUrl: dotenv.env['SWEET_TRACKER_BASE_URL'] ?? '',
        sweettrackerApiKey: dotenv.env['SWEET_TRACKER_API_KEY'] ?? '',
      );
      return Right(appVariable);
    } catch (error) {
      return const Left(GenericFailure());
    }
  }
}
