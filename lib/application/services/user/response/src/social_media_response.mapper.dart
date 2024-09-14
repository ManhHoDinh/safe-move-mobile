// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'social_media_response.dart';

class SocialMediaResponseMapper extends ClassMapperBase<SocialMediaResponse> {
  SocialMediaResponseMapper._();

  static SocialMediaResponseMapper? _instance;
  static SocialMediaResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SocialMediaResponseMapper._());
      SocialMediaTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SocialMediaResponse';

  static int? _$id(SocialMediaResponse v) => v.id;
  static const Field<SocialMediaResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static DateTime? _$createdAt(SocialMediaResponse v) => v.createdAt;
  static const Field<SocialMediaResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(SocialMediaResponse v) => v.updatedAt;
  static const Field<SocialMediaResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static SocialMediaType? _$socialType(SocialMediaResponse v) => v.socialType;
  static const Field<SocialMediaResponse, SocialMediaType> _f$socialType =
      Field('socialType', _$socialType, opt: true);
  static String? _$url(SocialMediaResponse v) => v.url;
  static const Field<SocialMediaResponse, String> _f$url =
      Field('url', _$url, opt: true);

  @override
  final MappableFields<SocialMediaResponse> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #socialType: _f$socialType,
    #url: _f$url,
  };

  static SocialMediaResponse _instantiate(DecodingData data) {
    return SocialMediaResponse(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        socialType: data.dec(_f$socialType),
        url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static SocialMediaResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SocialMediaResponse>(map);
  }

  static SocialMediaResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<SocialMediaResponse>(json);
  }
}

mixin SocialMediaResponseMappable {
  String toJsonString() {
    return SocialMediaResponseMapper.ensureInitialized()
        .encodeJson<SocialMediaResponse>(this as SocialMediaResponse);
  }

  Map<String, dynamic> toJson() {
    return SocialMediaResponseMapper.ensureInitialized()
        .encodeMap<SocialMediaResponse>(this as SocialMediaResponse);
  }

  SocialMediaResponseCopyWith<SocialMediaResponse, SocialMediaResponse,
          SocialMediaResponse>
      get copyWith => _SocialMediaResponseCopyWithImpl(
          this as SocialMediaResponse, $identity, $identity);
  @override
  String toString() {
    return SocialMediaResponseMapper.ensureInitialized()
        .stringifyValue(this as SocialMediaResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SocialMediaResponseMapper.ensureInitialized()
                .isValueEqual(this as SocialMediaResponse, other));
  }

  @override
  int get hashCode {
    return SocialMediaResponseMapper.ensureInitialized()
        .hashValue(this as SocialMediaResponse);
  }
}

extension SocialMediaResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SocialMediaResponse, $Out> {
  SocialMediaResponseCopyWith<$R, SocialMediaResponse, $Out>
      get $asSocialMediaResponse =>
          $base.as((v, t, t2) => _SocialMediaResponseCopyWithImpl(v, t, t2));
}

abstract class SocialMediaResponseCopyWith<$R, $In extends SocialMediaResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      SocialMediaType? socialType,
      String? url});
  SocialMediaResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SocialMediaResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SocialMediaResponse, $Out>
    implements SocialMediaResponseCopyWith<$R, SocialMediaResponse, $Out> {
  _SocialMediaResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SocialMediaResponse> $mapper =
      SocialMediaResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? socialType = $none,
          Object? url = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (socialType != $none) #socialType: socialType,
        if (url != $none) #url: url
      }));
  @override
  SocialMediaResponse $make(CopyWithData data) => SocialMediaResponse(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      socialType: data.get(#socialType, or: $value.socialType),
      url: data.get(#url, or: $value.url));

  @override
  SocialMediaResponseCopyWith<$R2, SocialMediaResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SocialMediaResponseCopyWithImpl($value, $cast, t);
}
