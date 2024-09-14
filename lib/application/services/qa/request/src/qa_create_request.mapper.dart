// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'qa_create_request.dart';

class QATypeMapper extends EnumMapper<QAType> {
  QATypeMapper._();

  static QATypeMapper? _instance;
  static QATypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QATypeMapper._());
    }
    return _instance!;
  }

  static QAType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  QAType decode(dynamic value) {
    return decodeQAType(value);
  }

  @override
  dynamic encode(QAType self) {
    return encodeQAType(self);
  }
}

QAType decodeQAType(dynamic value) {
  switch (value) {
    case 'PRODUCT':
      return QAType.product;
    case 'DELIVERY':
      return QAType.delivery;
    case 'RETURN_REFUND':
      return QAType.return_refund;
    case 'CANCELLATION':
      return QAType.cancel;
    case 'EXCHANGE':
      return QAType.exchange;
    case 'OTHER':
      return QAType.other;
    case 'ALL':
      return QAType.all;
    default:
      return QAType.all;
  }
}

String encodeQAType(QAType self) {
  switch (self) {
    case QAType.product:
      return 'PRODUCT';
    case QAType.delivery:
      return 'DELIVERY';
    case QAType.return_refund:
      return 'RETURN_REFUND';
    case QAType.cancel:
      return 'CANCELLATION';
    case QAType.exchange:
      return 'EXCHANGE';
    case QAType.other:
      return 'OTHER';
    case QAType.all:
      return 'ALL';
  }
}

extension QATypeMapperExtension on QAType {
  String toValue() {
    QATypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<QAType>(this) as String;
  }
}

class QACreateRequestMapper extends ClassMapperBase<QACreateRequest> {
  QACreateRequestMapper._();

  static QACreateRequestMapper? _instance;
  static QACreateRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QACreateRequestMapper._());
      QATypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QACreateRequest';

  static int _$productId(QACreateRequest v) => v.productId;
  static const Field<QACreateRequest, int> _f$productId =
      Field('productId', _$productId);
  static String _$question(QACreateRequest v) => v.question;
  static const Field<QACreateRequest, String> _f$question =
      Field('question', _$question);
  static QAType _$type(QACreateRequest v) => v.type;
  static const Field<QACreateRequest, QAType> _f$type = Field('type', _$type);

  @override
  final MappableFields<QACreateRequest> fields = const {
    #productId: _f$productId,
    #question: _f$question,
    #type: _f$type,
  };

  static QACreateRequest _instantiate(DecodingData data) {
    return QACreateRequest(
        productId: data.dec(_f$productId),
        question: data.dec(_f$question),
        type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static QACreateRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QACreateRequest>(map);
  }

  static QACreateRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<QACreateRequest>(json);
  }
}

mixin QACreateRequestMappable {
  String toJsonString() {
    return QACreateRequestMapper.ensureInitialized()
        .encodeJson<QACreateRequest>(this as QACreateRequest);
  }

  Map<String, dynamic> toJson() {
    return QACreateRequestMapper.ensureInitialized()
        .encodeMap<QACreateRequest>(this as QACreateRequest);
  }

  QACreateRequestCopyWith<QACreateRequest, QACreateRequest, QACreateRequest>
      get copyWith => _QACreateRequestCopyWithImpl(
          this as QACreateRequest, $identity, $identity);
  @override
  String toString() {
    return QACreateRequestMapper.ensureInitialized()
        .stringifyValue(this as QACreateRequest);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            QACreateRequestMapper.ensureInitialized()
                .isValueEqual(this as QACreateRequest, other));
  }

  @override
  int get hashCode {
    return QACreateRequestMapper.ensureInitialized()
        .hashValue(this as QACreateRequest);
  }
}

extension QACreateRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QACreateRequest, $Out> {
  QACreateRequestCopyWith<$R, QACreateRequest, $Out> get $asQACreateRequest =>
      $base.as((v, t, t2) => _QACreateRequestCopyWithImpl(v, t, t2));
}

abstract class QACreateRequestCopyWith<$R, $In extends QACreateRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? productId, String? question, QAType? type});
  QACreateRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _QACreateRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QACreateRequest, $Out>
    implements QACreateRequestCopyWith<$R, QACreateRequest, $Out> {
  _QACreateRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QACreateRequest> $mapper =
      QACreateRequestMapper.ensureInitialized();
  @override
  $R call({int? productId, String? question, QAType? type}) =>
      $apply(FieldCopyWithData({
        if (productId != null) #productId: productId,
        if (question != null) #question: question,
        if (type != null) #type: type
      }));
  @override
  QACreateRequest $make(CopyWithData data) => QACreateRequest(
      productId: data.get(#productId, or: $value.productId),
      question: data.get(#question, or: $value.question),
      type: data.get(#type, or: $value.type));

  @override
  QACreateRequestCopyWith<$R2, QACreateRequest, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _QACreateRequestCopyWithImpl($value, $cast, t);
}
