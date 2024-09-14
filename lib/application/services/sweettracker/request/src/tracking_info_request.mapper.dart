// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tracking_info_request.dart';

class TrackingInfoRequestMapper extends ClassMapperBase<TrackingInfoRequest> {
  TrackingInfoRequestMapper._();

  static TrackingInfoRequestMapper? _instance;
  static TrackingInfoRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackingInfoRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TrackingInfoRequest';

  static String _$tCode(TrackingInfoRequest v) => v.tCode;
  static const Field<TrackingInfoRequest, String> _f$tCode =
      Field('tCode', _$tCode);
  static String _$tInvoice(TrackingInfoRequest v) => v.tInvoice;
  static const Field<TrackingInfoRequest, String> _f$tInvoice =
      Field('tInvoice', _$tInvoice);
  static String _$tKey(TrackingInfoRequest v) => v.tKey;
  static const Field<TrackingInfoRequest, String> _f$tKey =
      Field('tKey', _$tKey);

  @override
  final MappableFields<TrackingInfoRequest> fields = const {
    #tCode: _f$tCode,
    #tInvoice: _f$tInvoice,
    #tKey: _f$tKey,
  };

  static TrackingInfoRequest _instantiate(DecodingData data) {
    return TrackingInfoRequest(
        tCode: data.dec(_f$tCode),
        tInvoice: data.dec(_f$tInvoice),
        tKey: data.dec(_f$tKey));
  }

  @override
  final Function instantiate = _instantiate;

  static TrackingInfoRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrackingInfoRequest>(map);
  }

  static TrackingInfoRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<TrackingInfoRequest>(json);
  }
}

mixin TrackingInfoRequestMappable {
  String toJsonString() {
    return TrackingInfoRequestMapper.ensureInitialized()
        .encodeJson<TrackingInfoRequest>(this as TrackingInfoRequest);
  }

  Map<String, dynamic> toJson() {
    return TrackingInfoRequestMapper.ensureInitialized()
        .encodeMap<TrackingInfoRequest>(this as TrackingInfoRequest);
  }

  TrackingInfoRequestCopyWith<TrackingInfoRequest, TrackingInfoRequest,
          TrackingInfoRequest>
      get copyWith => _TrackingInfoRequestCopyWithImpl(
          this as TrackingInfoRequest, $identity, $identity);
  @override
  String toString() {
    return TrackingInfoRequestMapper.ensureInitialized()
        .stringifyValue(this as TrackingInfoRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TrackingInfoRequestMapper.ensureInitialized()
                .isValueEqual(this as TrackingInfoRequest, other));
  }

  @override
  int get hashCode {
    return TrackingInfoRequestMapper.ensureInitialized()
        .hashValue(this as TrackingInfoRequest);
  }
}

extension TrackingInfoRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrackingInfoRequest, $Out> {
  TrackingInfoRequestCopyWith<$R, TrackingInfoRequest, $Out>
      get $asTrackingInfoRequest =>
          $base.as((v, t, t2) => _TrackingInfoRequestCopyWithImpl(v, t, t2));
}

abstract class TrackingInfoRequestCopyWith<$R, $In extends TrackingInfoRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? tCode, String? tInvoice, String? tKey});
  TrackingInfoRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TrackingInfoRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrackingInfoRequest, $Out>
    implements TrackingInfoRequestCopyWith<$R, TrackingInfoRequest, $Out> {
  _TrackingInfoRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrackingInfoRequest> $mapper =
      TrackingInfoRequestMapper.ensureInitialized();
  @override
  $R call({String? tCode, String? tInvoice, String? tKey}) =>
      $apply(FieldCopyWithData({
        if (tCode != null) #tCode: tCode,
        if (tInvoice != null) #tInvoice: tInvoice,
        if (tKey != null) #tKey: tKey
      }));
  @override
  TrackingInfoRequest $make(CopyWithData data) => TrackingInfoRequest(
      tCode: data.get(#tCode, or: $value.tCode),
      tInvoice: data.get(#tInvoice, or: $value.tInvoice),
      tKey: data.get(#tKey, or: $value.tKey));

  @override
  TrackingInfoRequestCopyWith<$R2, TrackingInfoRequest, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TrackingInfoRequestCopyWithImpl($value, $cast, t);
}
