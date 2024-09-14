// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tracking_detail_response.dart';

class TrackingDetailResponseMapper
    extends ClassMapperBase<TrackingDetailResponse> {
  TrackingDetailResponseMapper._();

  static TrackingDetailResponseMapper? _instance;
  static TrackingDetailResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TrackingDetailResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TrackingDetailResponse';

  static String? _$code(TrackingDetailResponse v) => v.code;
  static const Field<TrackingDetailResponse, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$kind(TrackingDetailResponse v) => v.kind;
  static const Field<TrackingDetailResponse, String> _f$kind =
      Field('kind', _$kind, opt: true);
  static int? _$level(TrackingDetailResponse v) => v.level;
  static const Field<TrackingDetailResponse, int> _f$level =
      Field('level', _$level, opt: true);
  static String? _$manName(TrackingDetailResponse v) => v.manName;
  static const Field<TrackingDetailResponse, String> _f$manName =
      Field('manName', _$manName, opt: true);
  static String? _$manPic(TrackingDetailResponse v) => v.manPic;
  static const Field<TrackingDetailResponse, String> _f$manPic =
      Field('manPic', _$manPic, opt: true);
  static String? _$remark(TrackingDetailResponse v) => v.remark;
  static const Field<TrackingDetailResponse, String> _f$remark =
      Field('remark', _$remark, opt: true);
  static String? _$telno(TrackingDetailResponse v) => v.telno;
  static const Field<TrackingDetailResponse, String> _f$telno =
      Field('telno', _$telno, opt: true);
  static String? _$telno2(TrackingDetailResponse v) => v.telno2;
  static const Field<TrackingDetailResponse, String> _f$telno2 =
      Field('telno2', _$telno2, opt: true);
  static String? _$time(TrackingDetailResponse v) => v.time;
  static const Field<TrackingDetailResponse, String> _f$time =
      Field('time', _$time, opt: true);
  static String? _$timeString(TrackingDetailResponse v) => v.timeString;
  static const Field<TrackingDetailResponse, String> _f$timeString =
      Field('timeString', _$timeString, opt: true);
  static String? _$where(TrackingDetailResponse v) => v.where;
  static const Field<TrackingDetailResponse, String> _f$where =
      Field('where', _$where, opt: true);

  @override
  final MappableFields<TrackingDetailResponse> fields = const {
    #code: _f$code,
    #kind: _f$kind,
    #level: _f$level,
    #manName: _f$manName,
    #manPic: _f$manPic,
    #remark: _f$remark,
    #telno: _f$telno,
    #telno2: _f$telno2,
    #time: _f$time,
    #timeString: _f$timeString,
    #where: _f$where,
  };

  static TrackingDetailResponse _instantiate(DecodingData data) {
    return TrackingDetailResponse(
        code: data.dec(_f$code),
        kind: data.dec(_f$kind),
        level: data.dec(_f$level),
        manName: data.dec(_f$manName),
        manPic: data.dec(_f$manPic),
        remark: data.dec(_f$remark),
        telno: data.dec(_f$telno),
        telno2: data.dec(_f$telno2),
        time: data.dec(_f$time),
        timeString: data.dec(_f$timeString),
        where: data.dec(_f$where));
  }

  @override
  final Function instantiate = _instantiate;

  static TrackingDetailResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrackingDetailResponse>(map);
  }

  static TrackingDetailResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<TrackingDetailResponse>(json);
  }
}

mixin TrackingDetailResponseMappable {
  String toJsonString() {
    return TrackingDetailResponseMapper.ensureInitialized()
        .encodeJson<TrackingDetailResponse>(this as TrackingDetailResponse);
  }

  Map<String, dynamic> toJson() {
    return TrackingDetailResponseMapper.ensureInitialized()
        .encodeMap<TrackingDetailResponse>(this as TrackingDetailResponse);
  }

  TrackingDetailResponseCopyWith<TrackingDetailResponse, TrackingDetailResponse,
          TrackingDetailResponse>
      get copyWith => _TrackingDetailResponseCopyWithImpl(
          this as TrackingDetailResponse, $identity, $identity);
  @override
  String toString() {
    return TrackingDetailResponseMapper.ensureInitialized()
        .stringifyValue(this as TrackingDetailResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TrackingDetailResponseMapper.ensureInitialized()
                .isValueEqual(this as TrackingDetailResponse, other));
  }

  @override
  int get hashCode {
    return TrackingDetailResponseMapper.ensureInitialized()
        .hashValue(this as TrackingDetailResponse);
  }
}

extension TrackingDetailResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrackingDetailResponse, $Out> {
  TrackingDetailResponseCopyWith<$R, TrackingDetailResponse, $Out>
      get $asTrackingDetailResponse =>
          $base.as((v, t, t2) => _TrackingDetailResponseCopyWithImpl(v, t, t2));
}

abstract class TrackingDetailResponseCopyWith<
    $R,
    $In extends TrackingDetailResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? code,
      String? kind,
      int? level,
      String? manName,
      String? manPic,
      String? remark,
      String? telno,
      String? telno2,
      String? time,
      String? timeString,
      String? where});
  TrackingDetailResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TrackingDetailResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrackingDetailResponse, $Out>
    implements
        TrackingDetailResponseCopyWith<$R, TrackingDetailResponse, $Out> {
  _TrackingDetailResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrackingDetailResponse> $mapper =
      TrackingDetailResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? code = $none,
          Object? kind = $none,
          Object? level = $none,
          Object? manName = $none,
          Object? manPic = $none,
          Object? remark = $none,
          Object? telno = $none,
          Object? telno2 = $none,
          Object? time = $none,
          Object? timeString = $none,
          Object? where = $none}) =>
      $apply(FieldCopyWithData({
        if (code != $none) #code: code,
        if (kind != $none) #kind: kind,
        if (level != $none) #level: level,
        if (manName != $none) #manName: manName,
        if (manPic != $none) #manPic: manPic,
        if (remark != $none) #remark: remark,
        if (telno != $none) #telno: telno,
        if (telno2 != $none) #telno2: telno2,
        if (time != $none) #time: time,
        if (timeString != $none) #timeString: timeString,
        if (where != $none) #where: where
      }));
  @override
  TrackingDetailResponse $make(CopyWithData data) => TrackingDetailResponse(
      code: data.get(#code, or: $value.code),
      kind: data.get(#kind, or: $value.kind),
      level: data.get(#level, or: $value.level),
      manName: data.get(#manName, or: $value.manName),
      manPic: data.get(#manPic, or: $value.manPic),
      remark: data.get(#remark, or: $value.remark),
      telno: data.get(#telno, or: $value.telno),
      telno2: data.get(#telno2, or: $value.telno2),
      time: data.get(#time, or: $value.time),
      timeString: data.get(#timeString, or: $value.timeString),
      where: data.get(#where, or: $value.where));

  @override
  TrackingDetailResponseCopyWith<$R2, TrackingDetailResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TrackingDetailResponseCopyWithImpl($value, $cast, t);
}
