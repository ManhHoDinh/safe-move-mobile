// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'presigned_url_upload_response.dart';

class PresignedUrlUploadResponseMapper
    extends ClassMapperBase<PresignedUrlUploadResponse> {
  PresignedUrlUploadResponseMapper._();

  static PresignedUrlUploadResponseMapper? _instance;
  static PresignedUrlUploadResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PresignedUrlUploadResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PresignedUrlUploadResponse';

  static String? _$uploadUrl(PresignedUrlUploadResponse v) => v.uploadUrl;
  static const Field<PresignedUrlUploadResponse, String> _f$uploadUrl =
      Field('uploadUrl', _$uploadUrl, opt: true);
  static String? _$fileKey(PresignedUrlUploadResponse v) => v.fileKey;
  static const Field<PresignedUrlUploadResponse, String> _f$fileKey =
      Field('fileKey', _$fileKey, opt: true);
  static String? _$previewUrl(PresignedUrlUploadResponse v) => v.previewUrl;
  static const Field<PresignedUrlUploadResponse, String> _f$previewUrl =
      Field('previewUrl', _$previewUrl, opt: true);

  @override
  final MappableFields<PresignedUrlUploadResponse> fields = const {
    #uploadUrl: _f$uploadUrl,
    #fileKey: _f$fileKey,
    #previewUrl: _f$previewUrl,
  };

  static PresignedUrlUploadResponse _instantiate(DecodingData data) {
    return PresignedUrlUploadResponse(
        uploadUrl: data.dec(_f$uploadUrl),
        fileKey: data.dec(_f$fileKey),
        previewUrl: data.dec(_f$previewUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static PresignedUrlUploadResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PresignedUrlUploadResponse>(map);
  }

  static PresignedUrlUploadResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<PresignedUrlUploadResponse>(json);
  }
}

mixin PresignedUrlUploadResponseMappable {
  String toJsonString() {
    return PresignedUrlUploadResponseMapper.ensureInitialized()
        .encodeJson<PresignedUrlUploadResponse>(
            this as PresignedUrlUploadResponse);
  }

  Map<String, dynamic> toJson() {
    return PresignedUrlUploadResponseMapper.ensureInitialized()
        .encodeMap<PresignedUrlUploadResponse>(
            this as PresignedUrlUploadResponse);
  }

  PresignedUrlUploadResponseCopyWith<PresignedUrlUploadResponse,
          PresignedUrlUploadResponse, PresignedUrlUploadResponse>
      get copyWith => _PresignedUrlUploadResponseCopyWithImpl(
          this as PresignedUrlUploadResponse, $identity, $identity);
  @override
  String toString() {
    return PresignedUrlUploadResponseMapper.ensureInitialized()
        .stringifyValue(this as PresignedUrlUploadResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PresignedUrlUploadResponseMapper.ensureInitialized()
                .isValueEqual(this as PresignedUrlUploadResponse, other));
  }

  @override
  int get hashCode {
    return PresignedUrlUploadResponseMapper.ensureInitialized()
        .hashValue(this as PresignedUrlUploadResponse);
  }
}

extension PresignedUrlUploadResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PresignedUrlUploadResponse, $Out> {
  PresignedUrlUploadResponseCopyWith<$R, PresignedUrlUploadResponse, $Out>
      get $asPresignedUrlUploadResponse => $base
          .as((v, t, t2) => _PresignedUrlUploadResponseCopyWithImpl(v, t, t2));
}

abstract class PresignedUrlUploadResponseCopyWith<
    $R,
    $In extends PresignedUrlUploadResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? uploadUrl, String? fileKey, String? previewUrl});
  PresignedUrlUploadResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PresignedUrlUploadResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PresignedUrlUploadResponse, $Out>
    implements
        PresignedUrlUploadResponseCopyWith<$R, PresignedUrlUploadResponse,
            $Out> {
  _PresignedUrlUploadResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PresignedUrlUploadResponse> $mapper =
      PresignedUrlUploadResponseMapper.ensureInitialized();
  @override
  $R call(
          {Object? uploadUrl = $none,
          Object? fileKey = $none,
          Object? previewUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (uploadUrl != $none) #uploadUrl: uploadUrl,
        if (fileKey != $none) #fileKey: fileKey,
        if (previewUrl != $none) #previewUrl: previewUrl
      }));
  @override
  PresignedUrlUploadResponse $make(CopyWithData data) =>
      PresignedUrlUploadResponse(
          uploadUrl: data.get(#uploadUrl, or: $value.uploadUrl),
          fileKey: data.get(#fileKey, or: $value.fileKey),
          previewUrl: data.get(#previewUrl, or: $value.previewUrl));

  @override
  PresignedUrlUploadResponseCopyWith<$R2, PresignedUrlUploadResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PresignedUrlUploadResponseCopyWithImpl($value, $cast, t);
}
