import '../dio_failure/dio_failure.dart';

class YoutubeFailure extends DioFailure {
  const YoutubeFailure({
    required super.apiPath,
    required this.statusCode,
    this.message,
    this.code,
  });

  final String? code;
  final String? message;
  final int statusCode;
}
