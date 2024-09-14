// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'qa_user_response.dart';

class QAUserResponseMapper extends ClassMapperBase<QAUserResponse> {
  QAUserResponseMapper._();

  static QAUserResponseMapper? _instance;
  static QAUserResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QAUserResponseMapper._());
      UserDTOMapper.ensureInitialized();
      ProductResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QAUserResponse';

  static int? _$id(QAUserResponse v) => v.id;
  static const Field<QAUserResponse, int> _f$id = Field('id', _$id, opt: true);
  static String? _$question(QAUserResponse v) => v.question;
  static const Field<QAUserResponse, String> _f$question =
      Field('question', _$question, opt: true);
  static UserDTO? _$asker(QAUserResponse v) => v.asker;
  static const Field<QAUserResponse, UserDTO> _f$asker =
      Field('asker', _$asker, opt: true);
  static String? _$answer(QAUserResponse v) => v.answer;
  static const Field<QAUserResponse, String> _f$answer =
      Field('answer', _$answer, opt: true);
  static bool? _$isHidden(QAUserResponse v) => v.isHidden;
  static const Field<QAUserResponse, bool> _f$isHidden =
      Field('isHidden', _$isHidden, opt: true);
  static String? _$type(QAUserResponse v) => v.type;
  static const Field<QAUserResponse, String> _f$type =
      Field('type', _$type, opt: true);
  static DateTime? _$createdAt(QAUserResponse v) => v.createdAt;
  static const Field<QAUserResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(QAUserResponse v) => v.updatedAt;
  static const Field<QAUserResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);
  static ProductResponse? _$productResponse(QAUserResponse v) =>
      v.productResponse;
  static const Field<QAUserResponse, ProductResponse> _f$productResponse =
      Field('productResponse', _$productResponse, opt: true);

  @override
  final MappableFields<QAUserResponse> fields = const {
    #id: _f$id,
    #question: _f$question,
    #asker: _f$asker,
    #answer: _f$answer,
    #isHidden: _f$isHidden,
    #type: _f$type,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #productResponse: _f$productResponse,
  };

  static QAUserResponse _instantiate(DecodingData data) {
    return QAUserResponse(
        id: data.dec(_f$id),
        question: data.dec(_f$question),
        asker: data.dec(_f$asker),
        answer: data.dec(_f$answer),
        isHidden: data.dec(_f$isHidden),
        type: data.dec(_f$type),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt),
        productResponse: data.dec(_f$productResponse));
  }

  @override
  final Function instantiate = _instantiate;

  static QAUserResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QAUserResponse>(map);
  }

  static QAUserResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<QAUserResponse>(json);
  }
}

mixin QAUserResponseMappable {
  String toJsonString() {
    return QAUserResponseMapper.ensureInitialized()
        .encodeJson<QAUserResponse>(this as QAUserResponse);
  }

  Map<String, dynamic> toJson() {
    return QAUserResponseMapper.ensureInitialized()
        .encodeMap<QAUserResponse>(this as QAUserResponse);
  }

  QAUserResponseCopyWith<QAUserResponse, QAUserResponse, QAUserResponse>
      get copyWith => _QAUserResponseCopyWithImpl(
          this as QAUserResponse, $identity, $identity);
  @override
  String toString() {
    return QAUserResponseMapper.ensureInitialized()
        .stringifyValue(this as QAUserResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            QAUserResponseMapper.ensureInitialized()
                .isValueEqual(this as QAUserResponse, other));
  }

  @override
  int get hashCode {
    return QAUserResponseMapper.ensureInitialized()
        .hashValue(this as QAUserResponse);
  }
}

extension QAUserResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QAUserResponse, $Out> {
  QAUserResponseCopyWith<$R, QAUserResponse, $Out> get $asQAUserResponse =>
      $base.as((v, t, t2) => _QAUserResponseCopyWithImpl(v, t, t2));
}

abstract class QAUserResponseCopyWith<$R, $In extends QAUserResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get asker;
  ProductResponseCopyWith<$R, ProductResponse, ProductResponse>?
      get productResponse;
  $R call(
      {int? id,
      String? question,
      UserDTO? asker,
      String? answer,
      bool? isHidden,
      String? type,
      DateTime? createdAt,
      DateTime? updatedAt,
      ProductResponse? productResponse});
  QAUserResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _QAUserResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QAUserResponse, $Out>
    implements QAUserResponseCopyWith<$R, QAUserResponse, $Out> {
  _QAUserResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QAUserResponse> $mapper =
      QAUserResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get asker =>
      $value.asker?.copyWith.$chain((v) => call(asker: v));
  @override
  ProductResponseCopyWith<$R, ProductResponse, ProductResponse>?
      get productResponse => $value.productResponse?.copyWith
          .$chain((v) => call(productResponse: v));
  @override
  $R call(
          {Object? id = $none,
          Object? question = $none,
          Object? asker = $none,
          Object? answer = $none,
          Object? isHidden = $none,
          Object? type = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none,
          Object? productResponse = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (question != $none) #question: question,
        if (asker != $none) #asker: asker,
        if (answer != $none) #answer: answer,
        if (isHidden != $none) #isHidden: isHidden,
        if (type != $none) #type: type,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (productResponse != $none) #productResponse: productResponse
      }));
  @override
  QAUserResponse $make(CopyWithData data) => QAUserResponse(
      id: data.get(#id, or: $value.id),
      question: data.get(#question, or: $value.question),
      asker: data.get(#asker, or: $value.asker),
      answer: data.get(#answer, or: $value.answer),
      isHidden: data.get(#isHidden, or: $value.isHidden),
      type: data.get(#type, or: $value.type),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      productResponse: data.get(#productResponse, or: $value.productResponse));

  @override
  QAUserResponseCopyWith<$R2, QAUserResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QAUserResponseCopyWithImpl($value, $cast, t);
}
