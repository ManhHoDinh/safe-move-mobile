// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile_url_response.dart';

class ProfileUrlResponseMapper extends ClassMapperBase<ProfileUrlResponse> {
  ProfileUrlResponseMapper._();

  static ProfileUrlResponseMapper? _instance;
  static ProfileUrlResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileUrlResponseMapper._());
      FileResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileUrlResponse';

  static int? _$id(ProfileUrlResponse v) => v.id;
  static const Field<ProfileUrlResponse, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$content(ProfileUrlResponse v) => v.content;
  static const Field<ProfileUrlResponse, String> _f$content =
      Field('content', _$content, opt: true);
  static String? _$url(ProfileUrlResponse v) => v.url;
  static const Field<ProfileUrlResponse, String> _f$url =
      Field('url', _$url, opt: true);
  static FileResponse? _$image(ProfileUrlResponse v) => v.image;
  static const Field<ProfileUrlResponse, FileResponse> _f$image =
      Field('image', _$image, opt: true);

  @override
  final MappableFields<ProfileUrlResponse> fields = const {
    #id: _f$id,
    #content: _f$content,
    #url: _f$url,
    #image: _f$image,
  };

  static ProfileUrlResponse _instantiate(DecodingData data) {
    return ProfileUrlResponse(
        id: data.dec(_f$id),
        content: data.dec(_f$content),
        url: data.dec(_f$url),
        image: data.dec(_f$image));
  }

  @override
  final Function instantiate = _instantiate;

  static ProfileUrlResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProfileUrlResponse>(map);
  }

  static ProfileUrlResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProfileUrlResponse>(json);
  }
}

mixin ProfileUrlResponseMappable {
  String toJsonString() {
    return ProfileUrlResponseMapper.ensureInitialized()
        .encodeJson<ProfileUrlResponse>(this as ProfileUrlResponse);
  }

  Map<String, dynamic> toJson() {
    return ProfileUrlResponseMapper.ensureInitialized()
        .encodeMap<ProfileUrlResponse>(this as ProfileUrlResponse);
  }

  ProfileUrlResponseCopyWith<ProfileUrlResponse, ProfileUrlResponse,
          ProfileUrlResponse>
      get copyWith => _ProfileUrlResponseCopyWithImpl(
          this as ProfileUrlResponse, $identity, $identity);
  @override
  String toString() {
    return ProfileUrlResponseMapper.ensureInitialized()
        .stringifyValue(this as ProfileUrlResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProfileUrlResponseMapper.ensureInitialized()
                .isValueEqual(this as ProfileUrlResponse, other));
  }

  @override
  int get hashCode {
    return ProfileUrlResponseMapper.ensureInitialized()
        .hashValue(this as ProfileUrlResponse);
  }
}

extension ProfileUrlResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfileUrlResponse, $Out> {
  ProfileUrlResponseCopyWith<$R, ProfileUrlResponse, $Out>
      get $asProfileUrlResponse =>
          $base.as((v, t, t2) => _ProfileUrlResponseCopyWithImpl(v, t, t2));
}

abstract class ProfileUrlResponseCopyWith<$R, $In extends ProfileUrlResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get image;
  $R call({int? id, String? content, String? url, FileResponse? image});
  ProfileUrlResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProfileUrlResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfileUrlResponse, $Out>
    implements ProfileUrlResponseCopyWith<$R, ProfileUrlResponse, $Out> {
  _ProfileUrlResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileUrlResponse> $mapper =
      ProfileUrlResponseMapper.ensureInitialized();
  @override
  FileResponseCopyWith<$R, FileResponse, FileResponse>? get image =>
      $value.image?.copyWith.$chain((v) => call(image: v));
  @override
  $R call(
          {Object? id = $none,
          Object? content = $none,
          Object? url = $none,
          Object? image = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (content != $none) #content: content,
        if (url != $none) #url: url,
        if (image != $none) #image: image
      }));
  @override
  ProfileUrlResponse $make(CopyWithData data) => ProfileUrlResponse(
      id: data.get(#id, or: $value.id),
      content: data.get(#content, or: $value.content),
      url: data.get(#url, or: $value.url),
      image: data.get(#image, or: $value.image));

  @override
  ProfileUrlResponseCopyWith<$R2, ProfileUrlResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProfileUrlResponseCopyWithImpl($value, $cast, t);
}
