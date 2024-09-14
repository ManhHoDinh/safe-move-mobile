// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'social_media_request.dart';

class SocialMediaRequestMapper extends ClassMapperBase<SocialMediaRequest> {
  SocialMediaRequestMapper._();

  static SocialMediaRequestMapper? _instance;
  static SocialMediaRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SocialMediaRequestMapper._());
      SocialMediaTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SocialMediaRequest';

  static int? _$id(SocialMediaRequest v) => v.id;
  static const Field<SocialMediaRequest, int> _f$id =
      Field('id', _$id, opt: true);
  static SocialMediaType _$type(SocialMediaRequest v) => v.type;
  static const Field<SocialMediaRequest, SocialMediaType> _f$type =
      Field('type', _$type);
  static String _$url(SocialMediaRequest v) => v.url;
  static const Field<SocialMediaRequest, String> _f$url = Field('url', _$url);

  @override
  final MappableFields<SocialMediaRequest> fields = const {
    #id: _f$id,
    #type: _f$type,
    #url: _f$url,
  };

  static SocialMediaRequest _instantiate(DecodingData data) {
    return SocialMediaRequest(
        id: data.dec(_f$id), type: data.dec(_f$type), url: data.dec(_f$url));
  }

  @override
  final Function instantiate = _instantiate;

  static SocialMediaRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SocialMediaRequest>(map);
  }

  static SocialMediaRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<SocialMediaRequest>(json);
  }
}

mixin SocialMediaRequestMappable {
  String toJsonString() {
    return SocialMediaRequestMapper.ensureInitialized()
        .encodeJson<SocialMediaRequest>(this as SocialMediaRequest);
  }

  Map<String, dynamic> toJson() {
    return SocialMediaRequestMapper.ensureInitialized()
        .encodeMap<SocialMediaRequest>(this as SocialMediaRequest);
  }

  SocialMediaRequestCopyWith<SocialMediaRequest, SocialMediaRequest,
          SocialMediaRequest>
      get copyWith => _SocialMediaRequestCopyWithImpl(
          this as SocialMediaRequest, $identity, $identity);
  @override
  String toString() {
    return SocialMediaRequestMapper.ensureInitialized()
        .stringifyValue(this as SocialMediaRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SocialMediaRequestMapper.ensureInitialized()
                .isValueEqual(this as SocialMediaRequest, other));
  }

  @override
  int get hashCode {
    return SocialMediaRequestMapper.ensureInitialized()
        .hashValue(this as SocialMediaRequest);
  }
}

extension SocialMediaRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SocialMediaRequest, $Out> {
  SocialMediaRequestCopyWith<$R, SocialMediaRequest, $Out>
      get $asSocialMediaRequest =>
          $base.as((v, t, t2) => _SocialMediaRequestCopyWithImpl(v, t, t2));
}

abstract class SocialMediaRequestCopyWith<$R, $In extends SocialMediaRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, SocialMediaType? type, String? url});
  SocialMediaRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SocialMediaRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SocialMediaRequest, $Out>
    implements SocialMediaRequestCopyWith<$R, SocialMediaRequest, $Out> {
  _SocialMediaRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SocialMediaRequest> $mapper =
      SocialMediaRequestMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, SocialMediaType? type, String? url}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (type != null) #type: type,
        if (url != null) #url: url
      }));
  @override
  SocialMediaRequest $make(CopyWithData data) => SocialMediaRequest(
      id: data.get(#id, or: $value.id),
      type: data.get(#type, or: $value.type),
      url: data.get(#url, or: $value.url));

  @override
  SocialMediaRequestCopyWith<$R2, SocialMediaRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SocialMediaRequestCopyWithImpl($value, $cast, t);
}
