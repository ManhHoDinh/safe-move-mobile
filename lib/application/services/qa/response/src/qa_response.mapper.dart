// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'qa_response.dart';

class QAResponseMapper extends ClassMapperBase<QAResponse> {
  QAResponseMapper._();

  static QAResponseMapper? _instance;
  static QAResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QAResponseMapper._());
      UserDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QAResponse';

  static int? _$id(QAResponse v) => v.id;
  static const Field<QAResponse, int> _f$id = Field('id', _$id, opt: true);
  static String? _$question(QAResponse v) => v.question;
  static const Field<QAResponse, String> _f$question =
      Field('question', _$question, opt: true);
  static UserDTO? _$asker(QAResponse v) => v.asker;
  static const Field<QAResponse, UserDTO> _f$asker =
      Field('asker', _$asker, opt: true);
  static String? _$answer(QAResponse v) => v.answer;
  static const Field<QAResponse, String> _f$answer =
      Field('answer', _$answer, opt: true);
  static bool? _$isHidden(QAResponse v) => v.isHidden;
  static const Field<QAResponse, bool> _f$isHidden =
      Field('isHidden', _$isHidden, opt: true);
  static String? _$type(QAResponse v) => v.type;
  static const Field<QAResponse, String> _f$type =
      Field('type', _$type, opt: true);
  static DateTime? _$createdAt(QAResponse v) => v.createdAt;
  static const Field<QAResponse, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, opt: true);
  static DateTime? _$updatedAt(QAResponse v) => v.updatedAt;
  static const Field<QAResponse, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<QAResponse> fields = const {
    #id: _f$id,
    #question: _f$question,
    #asker: _f$asker,
    #answer: _f$answer,
    #isHidden: _f$isHidden,
    #type: _f$type,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static QAResponse _instantiate(DecodingData data) {
    return QAResponse(
        id: data.dec(_f$id),
        question: data.dec(_f$question),
        asker: data.dec(_f$asker),
        answer: data.dec(_f$answer),
        isHidden: data.dec(_f$isHidden),
        type: data.dec(_f$type),
        createdAt: data.dec(_f$createdAt),
        updatedAt: data.dec(_f$updatedAt));
  }

  @override
  final Function instantiate = _instantiate;

  static QAResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QAResponse>(map);
  }

  static QAResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<QAResponse>(json);
  }
}

mixin QAResponseMappable {
  String toJsonString() {
    return QAResponseMapper.ensureInitialized()
        .encodeJson<QAResponse>(this as QAResponse);
  }

  Map<String, dynamic> toJson() {
    return QAResponseMapper.ensureInitialized()
        .encodeMap<QAResponse>(this as QAResponse);
  }

  QAResponseCopyWith<QAResponse, QAResponse, QAResponse> get copyWith =>
      _QAResponseCopyWithImpl(this as QAResponse, $identity, $identity);
  @override
  String toString() {
    return QAResponseMapper.ensureInitialized()
        .stringifyValue(this as QAResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            QAResponseMapper.ensureInitialized()
                .isValueEqual(this as QAResponse, other));
  }

  @override
  int get hashCode {
    return QAResponseMapper.ensureInitialized().hashValue(this as QAResponse);
  }
}

extension QAResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QAResponse, $Out> {
  QAResponseCopyWith<$R, QAResponse, $Out> get $asQAResponse =>
      $base.as((v, t, t2) => _QAResponseCopyWithImpl(v, t, t2));
}

abstract class QAResponseCopyWith<$R, $In extends QAResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get asker;
  $R call(
      {int? id,
      String? question,
      UserDTO? asker,
      String? answer,
      bool? isHidden,
      String? type,
      DateTime? createdAt,
      DateTime? updatedAt});
  QAResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QAResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QAResponse, $Out>
    implements QAResponseCopyWith<$R, QAResponse, $Out> {
  _QAResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QAResponse> $mapper =
      QAResponseMapper.ensureInitialized();
  @override
  UserDTOCopyWith<$R, UserDTO, UserDTO>? get asker =>
      $value.asker?.copyWith.$chain((v) => call(asker: v));
  @override
  $R call(
          {Object? id = $none,
          Object? question = $none,
          Object? asker = $none,
          Object? answer = $none,
          Object? isHidden = $none,
          Object? type = $none,
          Object? createdAt = $none,
          Object? updatedAt = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (question != $none) #question: question,
        if (asker != $none) #asker: asker,
        if (answer != $none) #answer: answer,
        if (isHidden != $none) #isHidden: isHidden,
        if (type != $none) #type: type,
        if (createdAt != $none) #createdAt: createdAt,
        if (updatedAt != $none) #updatedAt: updatedAt
      }));
  @override
  QAResponse $make(CopyWithData data) => QAResponse(
      id: data.get(#id, or: $value.id),
      question: data.get(#question, or: $value.question),
      asker: data.get(#asker, or: $value.asker),
      answer: data.get(#answer, or: $value.answer),
      isHidden: data.get(#isHidden, or: $value.isHidden),
      type: data.get(#type, or: $value.type),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt));

  @override
  QAResponseCopyWith<$R2, QAResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QAResponseCopyWithImpl($value, $cast, t);
}
