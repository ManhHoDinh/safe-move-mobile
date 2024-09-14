// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'paging_response.dart';

class PagingResponseMapper extends ClassMapperBase<PagingResponse> {
  PagingResponseMapper._();

  static PagingResponseMapper? _instance;
  static PagingResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PagingResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PagingResponse';
  @override
  Function get typeFactory => <T>(f) => f<PagingResponse<T>>();

  static int? _$totalPages(PagingResponse v) => v.totalPages;
  static const Field<PagingResponse, int> _f$totalPages =
      Field('totalPages', _$totalPages, opt: true);
  static int? _$totalElements(PagingResponse v) => v.totalElements;
  static const Field<PagingResponse, int> _f$totalElements =
      Field('totalElements', _$totalElements, opt: true);
  static List<dynamic>? _$content(PagingResponse v) => v.content;
  static dynamic _arg$content<T>(f) => f<List<T>>();
  static const Field<PagingResponse, List<dynamic>> _f$content =
      Field('content', _$content, opt: true, arg: _arg$content);

  @override
  final MappableFields<PagingResponse> fields = const {
    #totalPages: _f$totalPages,
    #totalElements: _f$totalElements,
    #content: _f$content,
  };

  static PagingResponse<T> _instantiate<T>(DecodingData data) {
    return PagingResponse(
        totalPages: data.dec(_f$totalPages),
        totalElements: data.dec(_f$totalElements),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static PagingResponse<T> fromJson<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PagingResponse<T>>(map);
  }

  static PagingResponse<T> fromJsonString<T>(String json) {
    return ensureInitialized().decodeJson<PagingResponse<T>>(json);
  }
}

mixin PagingResponseMappable<T> {
  String toJsonString() {
    return PagingResponseMapper.ensureInitialized()
        .encodeJson<PagingResponse<T>>(this as PagingResponse<T>);
  }

  Map<String, dynamic> toJson() {
    return PagingResponseMapper.ensureInitialized()
        .encodeMap<PagingResponse<T>>(this as PagingResponse<T>);
  }

  PagingResponseCopyWith<PagingResponse<T>, PagingResponse<T>,
          PagingResponse<T>, T>
      get copyWith => _PagingResponseCopyWithImpl(
          this as PagingResponse<T>, $identity, $identity);
  @override
  String toString() {
    return PagingResponseMapper.ensureInitialized()
        .stringifyValue(this as PagingResponse<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PagingResponseMapper.ensureInitialized()
                .isValueEqual(this as PagingResponse<T>, other));
  }

  @override
  int get hashCode {
    return PagingResponseMapper.ensureInitialized()
        .hashValue(this as PagingResponse<T>);
  }
}

extension PagingResponseValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, PagingResponse<T>, $Out> {
  PagingResponseCopyWith<$R, PagingResponse<T>, $Out, T>
      get $asPagingResponse =>
          $base.as((v, t, t2) => _PagingResponseCopyWithImpl(v, t, t2));
}

abstract class PagingResponseCopyWith<$R, $In extends PagingResponse<T>, $Out,
    T> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get content;
  $R call({int? totalPages, int? totalElements, List<T>? content});
  PagingResponseCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PagingResponseCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, PagingResponse<T>, $Out>
    implements PagingResponseCopyWith<$R, PagingResponse<T>, $Out, T> {
  _PagingResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PagingResponse> $mapper =
      PagingResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>>? get content =>
      $value.content != null
          ? ListCopyWith(
              $value.content!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(content: v))
          : null;
  @override
  $R call(
          {Object? totalPages = $none,
          Object? totalElements = $none,
          Object? content = $none}) =>
      $apply(FieldCopyWithData({
        if (totalPages != $none) #totalPages: totalPages,
        if (totalElements != $none) #totalElements: totalElements,
        if (content != $none) #content: content
      }));
  @override
  PagingResponse<T> $make(CopyWithData data) => PagingResponse(
      totalPages: data.get(#totalPages, or: $value.totalPages),
      totalElements: data.get(#totalElements, or: $value.totalElements),
      content: data.get(#content, or: $value.content));

  @override
  PagingResponseCopyWith<$R2, PagingResponse<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PagingResponseCopyWithImpl($value, $cast, t);
}
