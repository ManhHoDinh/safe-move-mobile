// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_response.dart';

class FileResponseMapper extends ClassMapperBase<FileResponse> {
  FileResponseMapper._();

  static FileResponseMapper? _instance;
  static FileResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FileResponse';

  static String? _$fileKey(FileResponse v) => v.fileKey;
  static const Field<FileResponse, String> _f$fileKey =
      Field('fileKey', _$fileKey, opt: true);
  static String? _$previewUrl(FileResponse v) => v.previewUrl;
  static const Field<FileResponse, String> _f$previewUrl =
      Field('previewUrl', _$previewUrl, opt: true);

  @override
  final MappableFields<FileResponse> fields = const {
    #fileKey: _f$fileKey,
    #previewUrl: _f$previewUrl,
  };

  static FileResponse _instantiate(DecodingData data) {
    return FileResponse(
        fileKey: data.dec(_f$fileKey), previewUrl: data.dec(_f$previewUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static FileResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileResponse>(map);
  }

  static FileResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<FileResponse>(json);
  }
}

mixin FileResponseMappable {
  String toJsonString() {
    return FileResponseMapper.ensureInitialized()
        .encodeJson<FileResponse>(this as FileResponse);
  }

  Map<String, dynamic> toJson() {
    return FileResponseMapper.ensureInitialized()
        .encodeMap<FileResponse>(this as FileResponse);
  }

  FileResponseCopyWith<FileResponse, FileResponse, FileResponse> get copyWith =>
      _FileResponseCopyWithImpl(this as FileResponse, $identity, $identity);
  @override
  String toString() {
    return FileResponseMapper.ensureInitialized()
        .stringifyValue(this as FileResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FileResponseMapper.ensureInitialized()
                .isValueEqual(this as FileResponse, other));
  }

  @override
  int get hashCode {
    return FileResponseMapper.ensureInitialized()
        .hashValue(this as FileResponse);
  }
}

extension FileResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileResponse, $Out> {
  FileResponseCopyWith<$R, FileResponse, $Out> get $asFileResponse =>
      $base.as((v, t, t2) => _FileResponseCopyWithImpl(v, t, t2));
}

abstract class FileResponseCopyWith<$R, $In extends FileResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? fileKey, String? previewUrl});
  FileResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileResponse, $Out>
    implements FileResponseCopyWith<$R, FileResponse, $Out> {
  _FileResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileResponse> $mapper =
      FileResponseMapper.ensureInitialized();
  @override
  $R call({Object? fileKey = $none, Object? previewUrl = $none}) =>
      $apply(FieldCopyWithData({
        if (fileKey != $none) #fileKey: fileKey,
        if (previewUrl != $none) #previewUrl: previewUrl
      }));
  @override
  FileResponse $make(CopyWithData data) => FileResponse(
      fileKey: data.get(#fileKey, or: $value.fileKey),
      previewUrl: data.get(#previewUrl, or: $value.previewUrl));

  @override
  FileResponseCopyWith<$R2, FileResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FileResponseCopyWithImpl($value, $cast, t);
}
