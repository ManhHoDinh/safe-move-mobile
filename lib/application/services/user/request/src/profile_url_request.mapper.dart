// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile_url_request.dart';

class ProfileUrlRequestMapper extends ClassMapperBase<ProfileUrlRequest> {
  ProfileUrlRequestMapper._();

  static ProfileUrlRequestMapper? _instance;
  static ProfileUrlRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileUrlRequestMapper._());
      FileRequestMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileUrlRequest';

  static int? _$id(ProfileUrlRequest v) => v.id;
  static const Field<ProfileUrlRequest, int> _f$id =
      Field('id', _$id, opt: true);
  static String _$content(ProfileUrlRequest v) => v.content;
  static const Field<ProfileUrlRequest, String> _f$content =
      Field('content', _$content);
  static String _$url(ProfileUrlRequest v) => v.url;
  static const Field<ProfileUrlRequest, String> _f$url = Field('url', _$url);
  static FileRequest? _$image(ProfileUrlRequest v) => v.image;
  static const Field<ProfileUrlRequest, FileRequest> _f$image =
      Field('image', _$image, opt: true);

  @override
  final MappableFields<ProfileUrlRequest> fields = const {
    #id: _f$id,
    #content: _f$content,
    #url: _f$url,
    #image: _f$image,
  };

  static ProfileUrlRequest _instantiate(DecodingData data) {
    return ProfileUrlRequest(
        id: data.dec(_f$id),
        content: data.dec(_f$content),
        url: data.dec(_f$url),
        image: data.dec(_f$image));
  }

  @override
  final Function instantiate = _instantiate;

  static ProfileUrlRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProfileUrlRequest>(map);
  }

  static ProfileUrlRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProfileUrlRequest>(json);
  }
}

mixin ProfileUrlRequestMappable {
  String toJsonString() {
    return ProfileUrlRequestMapper.ensureInitialized()
        .encodeJson<ProfileUrlRequest>(this as ProfileUrlRequest);
  }

  Map<String, dynamic> toJson() {
    return ProfileUrlRequestMapper.ensureInitialized()
        .encodeMap<ProfileUrlRequest>(this as ProfileUrlRequest);
  }

  ProfileUrlRequestCopyWith<ProfileUrlRequest, ProfileUrlRequest,
          ProfileUrlRequest>
      get copyWith => _ProfileUrlRequestCopyWithImpl(
          this as ProfileUrlRequest, $identity, $identity);
  @override
  String toString() {
    return ProfileUrlRequestMapper.ensureInitialized()
        .stringifyValue(this as ProfileUrlRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProfileUrlRequestMapper.ensureInitialized()
                .isValueEqual(this as ProfileUrlRequest, other));
  }

  @override
  int get hashCode {
    return ProfileUrlRequestMapper.ensureInitialized()
        .hashValue(this as ProfileUrlRequest);
  }
}

extension ProfileUrlRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfileUrlRequest, $Out> {
  ProfileUrlRequestCopyWith<$R, ProfileUrlRequest, $Out>
      get $asProfileUrlRequest =>
          $base.as((v, t, t2) => _ProfileUrlRequestCopyWithImpl(v, t, t2));
}

abstract class ProfileUrlRequestCopyWith<$R, $In extends ProfileUrlRequest,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  FileRequestCopyWith<$R, FileRequest, FileRequest>? get image;
  $R call({int? id, String? content, String? url, FileRequest? image});
  ProfileUrlRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProfileUrlRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfileUrlRequest, $Out>
    implements ProfileUrlRequestCopyWith<$R, ProfileUrlRequest, $Out> {
  _ProfileUrlRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileUrlRequest> $mapper =
      ProfileUrlRequestMapper.ensureInitialized();
  @override
  FileRequestCopyWith<$R, FileRequest, FileRequest>? get image =>
      $value.image?.copyWith.$chain((v) => call(image: v));
  @override
  $R call(
          {Object? id = $none,
          String? content,
          String? url,
          Object? image = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (content != null) #content: content,
        if (url != null) #url: url,
        if (image != $none) #image: image
      }));
  @override
  ProfileUrlRequest $make(CopyWithData data) => ProfileUrlRequest(
      id: data.get(#id, or: $value.id),
      content: data.get(#content, or: $value.content),
      url: data.get(#url, or: $value.url),
      image: data.get(#image, or: $value.image));

  @override
  ProfileUrlRequestCopyWith<$R2, ProfileUrlRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProfileUrlRequestCopyWithImpl($value, $cast, t);
}
