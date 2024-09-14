import 'package:dart_mappable/dart_mappable.dart';

part 'success_response.mapper.dart';

@MappableClass()
class SuccessResponse with SuccessResponseMappable {
  const SuccessResponse({
    this.success,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponseMapper.fromJson(json);

  final bool? success;
}
