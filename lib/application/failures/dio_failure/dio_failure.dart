import '../../../utilities/failure/failure.dart';

class DioFailure extends Failure {
  const DioFailure({
    required this.apiPath,
  });

  final String apiPath;
}

abstract class ResponseFailure extends DioFailure {
  const ResponseFailure({
    required this.statusCode,
    required super.apiPath,
    this.message,
    this.code,
  });

  final int statusCode;
  final String? code;
  final String? message;
}

class ServerFailure extends ResponseFailure {
  const ServerFailure({
    required super.apiPath,
    required super.statusCode,
    super.message,
    super.code,
  });
}

class BadRequestFailure extends ResponseFailure {
  const BadRequestFailure({
    required super.apiPath,
    required super.statusCode,
    super.message,
    super.code,
  });
}

class OtherDioFailure extends DioFailure {
  const OtherDioFailure({required super.apiPath});
}

class ConnectionFailure extends DioFailure {
  const ConnectionFailure({required super.apiPath});
}

class TimeoutFailure extends DioFailure {
  const TimeoutFailure({required super.apiPath});
}
