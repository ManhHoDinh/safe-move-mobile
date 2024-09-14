import 'package:dart_mappable/dart_mappable.dart';

part 'tracking_detail_response.mapper.dart';

@MappableClass()
class TrackingDetailResponse with TrackingDetailResponseMappable {
  const TrackingDetailResponse({
    this.code,
    this.kind,
    this.level,
    this.manName,
    this.manPic,
    this.remark,
    this.telno,
    this.telno2,
    this.time,
    this.timeString,
    this.where,
  });

  factory TrackingDetailResponse.fromJson(Map<String, dynamic> json) =>
      TrackingDetailResponseMapper.fromJson(json);

  final String? code;
  final String? kind;
  final int? level;
  final String? manName;
  final String? manPic;
  final String? remark;
  final String? telno;
  final String? telno2;
  final String? time;
  final String? timeString;
  final String? where;
}
