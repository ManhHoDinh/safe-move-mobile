// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'rating_request.dart';

class RatingRequestMapper extends ClassMapperBase<RatingRequest> {
  RatingRequestMapper._();

  static RatingRequestMapper? _instance;
  static RatingRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RatingRequestMapper._());
      FileRequestMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RatingRequest';

  static String? _$content(RatingRequest v) => v.content;
  static const Field<RatingRequest, String> _f$content =
      Field('content', _$content, opt: true);
  static int _$ratingPoint(RatingRequest v) => v.ratingPoint;
  static const Field<RatingRequest, int> _f$ratingPoint =
      Field('ratingPoint', _$ratingPoint);
  static int _$productId(RatingRequest v) => v.productId;
  static const Field<RatingRequest, int> _f$productId =
      Field('productId', _$productId);
  static List<FileRequest>? _$images(RatingRequest v) => v.images;
  static const Field<RatingRequest, List<FileRequest>> _f$images =
      Field('images', _$images, opt: true);

  @override
  final MappableFields<RatingRequest> fields = const {
    #content: _f$content,
    #ratingPoint: _f$ratingPoint,
    #productId: _f$productId,
    #images: _f$images,
  };

  static RatingRequest _instantiate(DecodingData data) {
    return RatingRequest(
        content: data.dec(_f$content),
        ratingPoint: data.dec(_f$ratingPoint),
        productId: data.dec(_f$productId),
        images: data.dec(_f$images));
  }

  @override
  final Function instantiate = _instantiate;

  static RatingRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RatingRequest>(map);
  }

  static RatingRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<RatingRequest>(json);
  }
}

mixin RatingRequestMappable {
  String toJsonString() {
    return RatingRequestMapper.ensureInitialized()
        .encodeJson<RatingRequest>(this as RatingRequest);
  }

  Map<String, dynamic> toJson() {
    return RatingRequestMapper.ensureInitialized()
        .encodeMap<RatingRequest>(this as RatingRequest);
  }

  RatingRequestCopyWith<RatingRequest, RatingRequest, RatingRequest>
      get copyWith => _RatingRequestCopyWithImpl(
          this as RatingRequest, $identity, $identity);
  @override
  String toString() {
    return RatingRequestMapper.ensureInitialized()
        .stringifyValue(this as RatingRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RatingRequestMapper.ensureInitialized()
                .isValueEqual(this as RatingRequest, other));
  }

  @override
  int get hashCode {
    return RatingRequestMapper.ensureInitialized()
        .hashValue(this as RatingRequest);
  }
}

extension RatingRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RatingRequest, $Out> {
  RatingRequestCopyWith<$R, RatingRequest, $Out> get $asRatingRequest =>
      $base.as((v, t, t2) => _RatingRequestCopyWithImpl(v, t, t2));
}

abstract class RatingRequestCopyWith<$R, $In extends RatingRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FileRequest,
      FileRequestCopyWith<$R, FileRequest, FileRequest>>? get images;
  $R call(
      {String? content,
      int? ratingPoint,
      int? productId,
      List<FileRequest>? images});
  RatingRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RatingRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RatingRequest, $Out>
    implements RatingRequestCopyWith<$R, RatingRequest, $Out> {
  _RatingRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RatingRequest> $mapper =
      RatingRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FileRequest,
          FileRequestCopyWith<$R, FileRequest, FileRequest>>?
      get images => $value.images != null
          ? ListCopyWith($value.images!, (v, t) => v.copyWith.$chain(t),
              (v) => call(images: v))
          : null;
  @override
  $R call(
          {Object? content = $none,
          int? ratingPoint,
          int? productId,
          Object? images = $none}) =>
      $apply(FieldCopyWithData({
        if (content != $none) #content: content,
        if (ratingPoint != null) #ratingPoint: ratingPoint,
        if (productId != null) #productId: productId,
        if (images != $none) #images: images
      }));
  @override
  RatingRequest $make(CopyWithData data) => RatingRequest(
      content: data.get(#content, or: $value.content),
      ratingPoint: data.get(#ratingPoint, or: $value.ratingPoint),
      productId: data.get(#productId, or: $value.productId),
      images: data.get(#images, or: $value.images));

  @override
  RatingRequestCopyWith<$R2, RatingRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RatingRequestCopyWithImpl($value, $cast, t);
}
