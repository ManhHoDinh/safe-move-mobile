// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tracking_info_response.dart';

class TrackingInfoResponseMapper extends ClassMapperBase<TrackingInfoResponse> {
  TrackingInfoResponseMapper._();

  static TrackingInfoResponseMapper? _instance;
  static TrackingInfoResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackingInfoResponseMapper._());
      TrackingDetailResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TrackingInfoResponse';

  static String? _$adUrl(TrackingInfoResponse v) => v.adUrl;
  static const Field<TrackingInfoResponse, String> _f$adUrl =
      Field('adUrl', _$adUrl, opt: true);
  static bool? _$complete(TrackingInfoResponse v) => v.complete;
  static const Field<TrackingInfoResponse, bool> _f$complete =
      Field('complete', _$complete, opt: true);
  static String? _$completeYN(TrackingInfoResponse v) => v.completeYN;
  static const Field<TrackingInfoResponse, String> _f$completeYN =
      Field('completeYN', _$completeYN, opt: true);
  static String? _$estimate(TrackingInfoResponse v) => v.estimate;
  static const Field<TrackingInfoResponse, String> _f$estimate =
      Field('estimate', _$estimate, opt: true);
  static TrackingDetailResponse? _$firstDetail(TrackingInfoResponse v) =>
      v.firstDetail;
  static const Field<TrackingInfoResponse, TrackingDetailResponse>
      _f$firstDetail = Field('firstDetail', _$firstDetail, opt: true);
  static String? _$invoiceNo(TrackingInfoResponse v) => v.invoiceNo;
  static const Field<TrackingInfoResponse, String> _f$invoiceNo =
      Field('invoiceNo', _$invoiceNo, opt: true);
  static String? _$itemImage(TrackingInfoResponse v) => v.itemImage;
  static const Field<TrackingInfoResponse, String> _f$itemImage =
      Field('itemImage', _$itemImage, opt: true);
  static String? _$itemName(TrackingInfoResponse v) => v.itemName;
  static const Field<TrackingInfoResponse, String> _f$itemName =
      Field('itemName', _$itemName, opt: true);
  static TrackingDetailResponse? _$lastDetail(TrackingInfoResponse v) =>
      v.lastDetail;
  static const Field<TrackingInfoResponse, TrackingDetailResponse>
      _f$lastDetail = Field('lastDetail', _$lastDetail, opt: true);
  static TrackingDetailResponse? _$lastStateDetail(TrackingInfoResponse v) =>
      v.lastStateDetail;
  static const Field<TrackingInfoResponse, TrackingDetailResponse>
      _f$lastStateDetail =
      Field('lastStateDetail', _$lastStateDetail, opt: true);
  static int? _$level(TrackingInfoResponse v) => v.level;
  static const Field<TrackingInfoResponse, int> _f$level =
      Field('level', _$level, opt: true);
  static String? _$orderNumber(TrackingInfoResponse v) => v.orderNumber;
  static const Field<TrackingInfoResponse, String> _f$orderNumber =
      Field('orderNumber', _$orderNumber, opt: true);
  static String? _$productInfo(TrackingInfoResponse v) => v.productInfo;
  static const Field<TrackingInfoResponse, String> _f$productInfo =
      Field('productInfo', _$productInfo, opt: true);
  static String? _$receiverAddr(TrackingInfoResponse v) => v.receiverAddr;
  static const Field<TrackingInfoResponse, String> _f$receiverAddr =
      Field('receiverAddr', _$receiverAddr, opt: true);
  static String? _$receiverName(TrackingInfoResponse v) => v.receiverName;
  static const Field<TrackingInfoResponse, String> _f$receiverName =
      Field('receiverName', _$receiverName, opt: true);
  static String? _$recipient(TrackingInfoResponse v) => v.recipient;
  static const Field<TrackingInfoResponse, String> _f$recipient =
      Field('recipient', _$recipient, opt: true);
  static String? _$result(TrackingInfoResponse v) => v.result;
  static const Field<TrackingInfoResponse, String> _f$result =
      Field('result', _$result, opt: true);
  static String? _$senderName(TrackingInfoResponse v) => v.senderName;
  static const Field<TrackingInfoResponse, String> _f$senderName =
      Field('senderName', _$senderName, opt: true);
  static List<TrackingDetailResponse>? _$trackingDetails(
          TrackingInfoResponse v) =>
      v.trackingDetails;
  static const Field<TrackingInfoResponse, List<TrackingDetailResponse>>
      _f$trackingDetails =
      Field('trackingDetails', _$trackingDetails, opt: true);
  static String? _$zipCode(TrackingInfoResponse v) => v.zipCode;
  static const Field<TrackingInfoResponse, String> _f$zipCode =
      Field('zipCode', _$zipCode, opt: true);

  @override
  final MappableFields<TrackingInfoResponse> fields = const {
    #adUrl: _f$adUrl,
    #complete: _f$complete,
    #completeYN: _f$completeYN,
    #estimate: _f$estimate,
    #firstDetail: _f$firstDetail,
    #invoiceNo: _f$invoiceNo,
    #itemImage: _f$itemImage,
    #itemName: _f$itemName,
    #lastDetail: _f$lastDetail,
    #lastStateDetail: _f$lastStateDetail,
    #level: _f$level,
    #orderNumber: _f$orderNumber,
    #productInfo: _f$productInfo,
    #receiverAddr: _f$receiverAddr,
    #receiverName: _f$receiverName,
    #recipient: _f$recipient,
    #result: _f$result,
    #senderName: _f$senderName,
    #trackingDetails: _f$trackingDetails,
    #zipCode: _f$zipCode,
  };

  static TrackingInfoResponse _instantiate(DecodingData data) {
    return TrackingInfoResponse(
        adUrl: data.dec(_f$adUrl),
        complete: data.dec(_f$complete),
        completeYN: data.dec(_f$completeYN),
        estimate: data.dec(_f$estimate),
        firstDetail: data.dec(_f$firstDetail),
        invoiceNo: data.dec(_f$invoiceNo),
        itemImage: data.dec(_f$itemImage),
        itemName: data.dec(_f$itemName),
        lastDetail: data.dec(_f$lastDetail),
        lastStateDetail: data.dec(_f$lastStateDetail),
        level: data.dec(_f$level),
        orderNumber: data.dec(_f$orderNumber),
        productInfo: data.dec(_f$productInfo),
        receiverAddr: data.dec(_f$receiverAddr),
        receiverName: data.dec(_f$receiverName),
        recipient: data.dec(_f$recipient),
        result: data.dec(_f$result),
        senderName: data.dec(_f$senderName),
        trackingDetails: data.dec(_f$trackingDetails),
        zipCode: data.dec(_f$zipCode));
  }

  @override
  final Function instantiate = _instantiate;

  static TrackingInfoResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrackingInfoResponse>(map);
  }

  static TrackingInfoResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<TrackingInfoResponse>(json);
  }
}

mixin TrackingInfoResponseMappable {
  String toJsonString() {
    return TrackingInfoResponseMapper.ensureInitialized()
        .encodeJson<TrackingInfoResponse>(this as TrackingInfoResponse);
  }

  Map<String, dynamic> toJson() {
    return TrackingInfoResponseMapper.ensureInitialized()
        .encodeMap<TrackingInfoResponse>(this as TrackingInfoResponse);
  }

  TrackingInfoResponseCopyWith<TrackingInfoResponse, TrackingInfoResponse,
          TrackingInfoResponse>
      get copyWith => _TrackingInfoResponseCopyWithImpl(
          this as TrackingInfoResponse, $identity, $identity);
  @override
  String toString() {
    return TrackingInfoResponseMapper.ensureInitialized()
        .stringifyValue(this as TrackingInfoResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TrackingInfoResponseMapper.ensureInitialized()
                .isValueEqual(this as TrackingInfoResponse, other));
  }

  @override
  int get hashCode {
    return TrackingInfoResponseMapper.ensureInitialized()
        .hashValue(this as TrackingInfoResponse);
  }
}

extension TrackingInfoResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrackingInfoResponse, $Out> {
  TrackingInfoResponseCopyWith<$R, TrackingInfoResponse, $Out>
      get $asTrackingInfoResponse =>
          $base.as((v, t, t2) => _TrackingInfoResponseCopyWithImpl(v, t, t2));
}

abstract class TrackingInfoResponseCopyWith<
    $R,
    $In extends TrackingInfoResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
      TrackingDetailResponse>? get firstDetail;
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
      TrackingDetailResponse>? get lastDetail;
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
      TrackingDetailResponse>? get lastStateDetail;
  ListCopyWith<
      $R,
      TrackingDetailResponse,
      TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
          TrackingDetailResponse>>? get trackingDetails;
  $R call(
      {String? adUrl,
      bool? complete,
      String? completeYN,
      String? estimate,
      TrackingDetailResponse? firstDetail,
      String? invoiceNo,
      String? itemImage,
      String? itemName,
      TrackingDetailResponse? lastDetail,
      TrackingDetailResponse? lastStateDetail,
      int? level,
      String? orderNumber,
      String? productInfo,
      String? receiverAddr,
      String? receiverName,
      String? recipient,
      String? result,
      String? senderName,
      List<TrackingDetailResponse>? trackingDetails,
      String? zipCode});
  TrackingInfoResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TrackingInfoResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrackingInfoResponse, $Out>
    implements TrackingInfoResponseCopyWith<$R, TrackingInfoResponse, $Out> {
  _TrackingInfoResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrackingInfoResponse> $mapper =
      TrackingInfoResponseMapper.ensureInitialized();
  @override
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
          TrackingDetailResponse>?
      get firstDetail =>
          $value.firstDetail?.copyWith.$chain((v) => call(firstDetail: v));
  @override
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
          TrackingDetailResponse>?
      get lastDetail =>
          $value.lastDetail?.copyWith.$chain((v) => call(lastDetail: v));
  @override
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
          TrackingDetailResponse>?
      get lastStateDetail => $value.lastStateDetail?.copyWith
          .$chain((v) => call(lastStateDetail: v));
  @override
  ListCopyWith<
      $R,
      TrackingDetailResponse,
      TrackingDetailResponseCopyWith<$R, TrackingDetailResponse,
          TrackingDetailResponse>>? get trackingDetails =>
      $value.trackingDetails != null
          ? ListCopyWith($value.trackingDetails!,
              (v, t) => v.copyWith.$chain(t), (v) => call(trackingDetails: v))
          : null;
  @override
  $R call(
          {Object? adUrl = $none,
          Object? complete = $none,
          Object? completeYN = $none,
          Object? estimate = $none,
          Object? firstDetail = $none,
          Object? invoiceNo = $none,
          Object? itemImage = $none,
          Object? itemName = $none,
          Object? lastDetail = $none,
          Object? lastStateDetail = $none,
          Object? level = $none,
          Object? orderNumber = $none,
          Object? productInfo = $none,
          Object? receiverAddr = $none,
          Object? receiverName = $none,
          Object? recipient = $none,
          Object? result = $none,
          Object? senderName = $none,
          Object? trackingDetails = $none,
          Object? zipCode = $none}) =>
      $apply(FieldCopyWithData({
        if (adUrl != $none) #adUrl: adUrl,
        if (complete != $none) #complete: complete,
        if (completeYN != $none) #completeYN: completeYN,
        if (estimate != $none) #estimate: estimate,
        if (firstDetail != $none) #firstDetail: firstDetail,
        if (invoiceNo != $none) #invoiceNo: invoiceNo,
        if (itemImage != $none) #itemImage: itemImage,
        if (itemName != $none) #itemName: itemName,
        if (lastDetail != $none) #lastDetail: lastDetail,
        if (lastStateDetail != $none) #lastStateDetail: lastStateDetail,
        if (level != $none) #level: level,
        if (orderNumber != $none) #orderNumber: orderNumber,
        if (productInfo != $none) #productInfo: productInfo,
        if (receiverAddr != $none) #receiverAddr: receiverAddr,
        if (receiverName != $none) #receiverName: receiverName,
        if (recipient != $none) #recipient: recipient,
        if (result != $none) #result: result,
        if (senderName != $none) #senderName: senderName,
        if (trackingDetails != $none) #trackingDetails: trackingDetails,
        if (zipCode != $none) #zipCode: zipCode
      }));
  @override
  TrackingInfoResponse $make(CopyWithData data) => TrackingInfoResponse(
      adUrl: data.get(#adUrl, or: $value.adUrl),
      complete: data.get(#complete, or: $value.complete),
      completeYN: data.get(#completeYN, or: $value.completeYN),
      estimate: data.get(#estimate, or: $value.estimate),
      firstDetail: data.get(#firstDetail, or: $value.firstDetail),
      invoiceNo: data.get(#invoiceNo, or: $value.invoiceNo),
      itemImage: data.get(#itemImage, or: $value.itemImage),
      itemName: data.get(#itemName, or: $value.itemName),
      lastDetail: data.get(#lastDetail, or: $value.lastDetail),
      lastStateDetail: data.get(#lastStateDetail, or: $value.lastStateDetail),
      level: data.get(#level, or: $value.level),
      orderNumber: data.get(#orderNumber, or: $value.orderNumber),
      productInfo: data.get(#productInfo, or: $value.productInfo),
      receiverAddr: data.get(#receiverAddr, or: $value.receiverAddr),
      receiverName: data.get(#receiverName, or: $value.receiverName),
      recipient: data.get(#recipient, or: $value.recipient),
      result: data.get(#result, or: $value.result),
      senderName: data.get(#senderName, or: $value.senderName),
      trackingDetails: data.get(#trackingDetails, or: $value.trackingDetails),
      zipCode: data.get(#zipCode, or: $value.zipCode));

  @override
  TrackingInfoResponseCopyWith<$R2, TrackingInfoResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TrackingInfoResponseCopyWithImpl($value, $cast, t);
}
