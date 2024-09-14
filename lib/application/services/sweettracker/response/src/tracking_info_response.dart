import 'package:dart_mappable/dart_mappable.dart';

import 'tracking_detail_response.dart';

part 'tracking_info_response.mapper.dart';

@MappableClass()
class TrackingInfoResponse with TrackingInfoResponseMappable {
  const TrackingInfoResponse({
    this.adUrl,
    this.complete,
    this.completeYN,
    this.estimate,
    this.firstDetail,
    this.invoiceNo,
    this.itemImage,
    this.itemName,
    this.lastDetail,
    this.lastStateDetail,
    this.level,
    this.orderNumber,
    this.productInfo,
    this.receiverAddr,
    this.receiverName,
    this.recipient,
    this.result,
    this.senderName,
    this.trackingDetails,
    this.zipCode,
  });

  factory TrackingInfoResponse.fromJson(Map<String, dynamic> json) =>
      TrackingInfoResponseMapper.fromJson(json);

  final String? adUrl;
  final bool? complete;
  final String? completeYN;
  final String? estimate;

  final TrackingDetailResponse? firstDetail;
  final String? invoiceNo;
  final String? itemImage;
  final String? itemName;

  final TrackingDetailResponse? lastDetail;
  final TrackingDetailResponse? lastStateDetail;
  final int? level;
  final String? orderNumber;
  final String? productInfo;
  final String? receiverAddr;
  final String? receiverName;
  final String? recipient;
  final String? result;
  final String? senderName;

  final List<TrackingDetailResponse>? trackingDetails;
  final String? zipCode;
}
