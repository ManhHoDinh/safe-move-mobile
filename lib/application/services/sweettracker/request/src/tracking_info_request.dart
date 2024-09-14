import 'package:dart_mappable/dart_mappable.dart';

part 'tracking_info_request.mapper.dart';

@MappableClass()
class TrackingInfoRequest with TrackingInfoRequestMappable {
  const TrackingInfoRequest({
    required this.tCode,
    required this.tInvoice,
    required this.tKey,
  });

  factory TrackingInfoRequest.fromJson(Map<String, dynamic> json) =>
      TrackingInfoRequestMapper.fromJson(json);

  final String tCode;

  final String tInvoice;

  final String tKey;
}
