import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';

class AppConfig {
  const AppConfig({
    required this.baseUrl,
    required this.version,
    required this.kakaoNativeAppKey,
    required this.youtubeApiKey,
    required this.youtubePlayListId,
    required this.clientTossKey,
    required this.oneSignalAppId,
    required this.appLink,
    required this.sweettrackerBaseUrl,
    required this.sweettrackerApiKey,
  });

  final String version;
  final String baseUrl;
  final String kakaoNativeAppKey;
  final String youtubePlayListId;
  final String youtubeApiKey;
  final String clientTossKey;
  final String oneSignalAppId;
  final String appLink;
  final String sweettrackerBaseUrl;
  final String sweettrackerApiKey;
}

mixin AppConfigLoader {
  Future<Result<Failure, AppConfig>> loadConfig();
}
