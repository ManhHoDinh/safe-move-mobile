// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'rating_response.dart';

class RatingResponseMapper extends ClassMapperBase<RatingResponse> {
  RatingResponseMapper._();

  static RatingResponseMapper? _instance;
  static RatingResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RatingResponseMapper._());
      UserDTOMapper.ensureInitialized();
      FileResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RatingResponse';

  static int? _$id(RatingResponse v) => v.id;
  static const Field<RatingResponse, int> _f$id = Field('id', _$id, opt: true);
  static UserDTO? _$writer(RatingResponse v) => v.writer;
  static const Field<RatingResponse, UserDTO> _f$writer =
      Field('writer', _$writer, opt: true);
  static DateTime? _$createdAt(RatingResponse v) => v.createdAt;
  static const Field<RatingResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(RatingResponse v) => v.updatedAt;
  static const Field<RatingResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static List<FileResponse>? _$images(RatingResponse v) => v.images;
  static const Field<RatingResponse, List<FileResponse>> _f$images =
      Field('images', _$images, opt: true);
  static String? _$content(RatingResponse v) => v.content;
  static const Field<RatingResponse, String> _f$content =
      Field('content', _$content, opt: true);
  static int? _$ratingPoint(RatingResponse v) => v.ratingPoint;
  static const Field<RatingResponse, int> _f$ratingPoint =
      Field('ratingPoint', _$ratingPoint, opt: true);
  static bool? _$isHidden(RatingResponse v) => v.isHidden;
  static const Field<RatingResponse, bool> _f$isHidden =
      Field('isHidden', _$isHidden, opt: true);

  @override
  final MappableFields<RatingResponse> fields = const {
    #id: _f$id,
    #writer: _f$writer,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #images: _f$images,
    #content: _f$content,
    #ratingPoint: _f$ratingPoint,
    #isHidden: _f$isHidden,
  };

  static RatingResponse _instantiate(DecodingData data) {
    return RatingResponse(
        id: data.dec(_f$id),
        writer: data.dec(_f$writer),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        images: data.dec(_f$images),
        content: data.dec(_f$content),
        ratingPoint: data.dec(_f$ratingPoint),
        isHidden: data.dec(_f$isHidden));
  }

  @override
  final Function instantiate = _instantiate;

  static RatingResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RatingResponse>(map);
  }

  static RatingResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<RatingResponse>(json);
  }
}

mixin RatingResponseMappable {
  String toJsonString() {
    return RatingResponseMapper.ensureInitialized()
        .encodeJson<RatingResponse>(this as RatingResponse);
  }

  Map<String, dynamic> toJson() {
    return RatingResponseMapper.ensureInitialized()
        .encodeMap<RatingResponse>(this as RatingResponse);
  }

  RatingResponseCopyWith<RatingResponse, RatingResponse, RatingResponse>
      get copyWith => _RatingResponseCopyWithImpl(
          this as RatingResponse, $identity, $identity);
  @override
  String toString() {
    return RatingResponseMapper.ensureInitialized()
        .stringifyValue(this as RatingResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RatingResponseMapper.ensureInitialized()
                .isValueEqual(this as RatingResponse, other));
  }

  @override
  int get hashCode {
    return RatingResponseMapper.ensureInitialized()
        .hashValue(this as RatingResponse);
  }
}

extension RatingResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RatingResponse, $Out> {
  RatingResponseCopyWith<$R, RatingResponse, $Out> get $asRatingResponse =>
      $base.as((v, t, t2) => _RatingResponseCopyWithImpl(v, t, t2));
}

abstract class RatingResponseCopyWith<$R, $In extends RatingResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get writer;
  ListCopyWith<$R, FileResponse,
      FileResponseCopyWith<$R, FileResponse, FileResponse>>? get images;
  $R call(
      {int? id,
      UserDTO? writer,
      DateTime? createdAt,
      DateTime? updatedAt,
      List<FileResponse>? images,
      String? content,
      int? ratingPoint,
      bool? isHidden});
  RatingResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RatingResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RatingResponse, $Out>
    implements RatingResponseCopyWith<$R, RatingResponse, $Out> {
  _RatingResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RatingResponse> $mapper =
      RatingResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get writer =>
      $value.writer?.copyWith.$chain((v) => call(writer: v));
  @override
  ListCopyWith<$R, FileResponse,
          FileResponseCopyWith<$R, FileResponse, FileResponse>>?
      get images => $value.images != null
          ? ListCopyWith($value.images!, (v, t) => v.copyWith.$chain(t),
              (v) => call(images: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? writer = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? images = $none,
          Object? content = $none,
          Object? ratingPoint = $none,
          Object? isHidden = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (writer != $none) #writer: writer,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (images != $none) #images: images,
        if (content != $none) #content: content,
        if (ratingPoint != $none) #ratingPoint: ratingPoint,
        if (isHidden != $none) #isHidden: isHidden
      }));
  @override
  RatingResponse $make(CopyWithData data) => RatingResponse(
      id: data.get(#id, or: $value.id),
      writer: data.get(#writer, or: $value.writer),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      images: data.get(#images, or: $value.images),
      content: data.get(#content, or: $value.content),
      ratingPoint: data.get(#ratingPoint, or: $value.ratingPoint),
      isHidden: data.get(#isHidden, or: $value.isHidden));

  @override
  RatingResponseCopyWith<$R2, RatingResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RatingResponseCopyWithImpl($value, $cast, t);
}
