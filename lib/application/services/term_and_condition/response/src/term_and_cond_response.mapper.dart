// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'term_and_cond_response.dart';

class TermAndCondResponseMapper extends ClassMapperBase<TermAndCondResponse> {
  TermAndCondResponseMapper._();

  static TermAndCondResponseMapper? _instance;
  static TermAndCondResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TermAndCondResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TermAndCondResponse';

  static int? _$id(TermAndCondResponse v) => v.id;
  static const Field<TermAndCondResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$createdAt(TermAndCondResponse v) => v.createdAt;
  static const Field<TermAndCondResponse, String> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static String? _$termType(TermAndCondResponse v) => v.termType;
  static const Field<TermAndCondResponse, String> _f$termType =
      Field('termType', _$termType, opt: true);
  static String? _$contentKr(TermAndCondResponse v) => v.contentKr;
  static const Field<TermAndCondResponse, String> _f$contentKr =
      Field('contentKr', _$contentKr, opt: true);
  static String? _$contentEn(TermAndCondResponse v) => v.contentEn;
  static const Field<TermAndCondResponse, String> _f$contentEn =
      Field('contentEn', _$contentEn, opt: true);
  static String? _$contentCn(TermAndCondResponse v) => v.contentCn;
  static const Field<TermAndCondResponse, String> _f$contentCn =
      Field('contentCn', _$contentCn, opt: true);
  static String? _$contentJp(TermAndCondResponse v) => v.contentJp;
  static const Field<TermAndCondResponse, String> _f$contentJp =
      Field('contentJp', _$contentJp, opt: true);

  @override
  final MappableFields<TermAndCondResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #termType: _f$termType,
    #contentKr: _f$contentKr,
    #contentEn: _f$contentEn,
    #contentCn: _f$contentCn,
    #contentJp: _f$contentJp,
  };

  static TermAndCondResponse _instantiate(DecodingData data) {
    return TermAndCondResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        termType: data.dec(_f$termType),
        contentKr: data.dec(_f$contentKr),
        contentEn: data.dec(_f$contentEn),
        contentCn: data.dec(_f$contentCn),
        contentJp: data.dec(_f$contentJp));
  }

  @override
  final Function instantiate = _instantiate;

  static TermAndCondResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TermAndCondResponse>(map);
  }

  static TermAndCondResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<TermAndCondResponse>(json);
  }
}

mixin TermAndCondResponseMappable {
  String toJsonString() {
    return TermAndCondResponseMapper.ensureInitialized()
        .encodeJson<TermAndCondResponse>(this as TermAndCondResponse);
  }

  Map<String, dynamic> toJson() {
    return TermAndCondResponseMapper.ensureInitialized()
        .encodeMap<TermAndCondResponse>(this as TermAndCondResponse);
  }

  TermAndCondResponseCopyWith<TermAndCondResponse, TermAndCondResponse,
          TermAndCondResponse>
      get copyWith => _TermAndCondResponseCopyWithImpl(
          this as TermAndCondResponse, $identity, $identity);
  @override
  String toString() {
    return TermAndCondResponseMapper.ensureInitialized()
        .stringifyValue(this as TermAndCondResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TermAndCondResponseMapper.ensureInitialized()
                .isValueEqual(this as TermAndCondResponse, other));
  }

  @override
  int get hashCode {
    return TermAndCondResponseMapper.ensureInitialized()
        .hashValue(this as TermAndCondResponse);
  }
}

extension TermAndCondResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TermAndCondResponse, $Out> {
  TermAndCondResponseCopyWith<$R, TermAndCondResponse, $Out>
      get $asTermAndCondResponse =>
          $base.as((v, t, t2) => _TermAndCondResponseCopyWithImpl(v, t, t2));
}

abstract class TermAndCondResponseCopyWith<$R, $In extends TermAndCondResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? createdAt,
      String? termType,
      String? contentKr,
      String? contentEn,
      String? contentCn,
      String? contentJp});
  TermAndCondResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TermAndCondResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TermAndCondResponse, $Out>
    implements TermAndCondResponseCopyWith<$R, TermAndCondResponse, $Out> {
  _TermAndCondResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TermAndCondResponse> $mapper =
      TermAndCondResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? termType = $none,
          Object? contentKr = $none,
          Object? contentEn = $none,
          Object? contentCn = $none,
          Object? contentJp = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (termType != $none) #termType: termType,
        if (contentKr != $none) #contentKr: contentKr,
        if (contentEn != $none) #contentEn: contentEn,
        if (contentCn != $none) #contentCn: contentCn,
        if (contentJp != $none) #contentJp: contentJp
      }));
  @override
  TermAndCondResponse $make(CopyWithData data) => TermAndCondResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      termType: data.get(#termType, or: $value.termType),
      contentKr: data.get(#contentKr, or: $value.contentKr),
      contentEn: data.get(#contentEn, or: $value.contentEn),
      contentCn: data.get(#contentCn, or: $value.contentCn),
      contentJp: data.get(#contentJp, or: $value.contentJp));

  @override
  TermAndCondResponseCopyWith<$R2, TermAndCondResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TermAndCondResponseCopyWithImpl($value, $cast, t);
}
