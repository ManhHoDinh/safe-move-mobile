// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'localized_field_value.dart';

class LocalizedFieldValueMapper extends ClassMapperBase<LocalizedFieldValue> {
  LocalizedFieldValueMapper._();

  static LocalizedFieldValueMapper? _instance;
  static LocalizedFieldValueMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalizedFieldValueMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalizedFieldValue';

  static int? _$id(LocalizedFieldValue v) => v.id;
  static const Field<LocalizedFieldValue, int> _f$id =
      Field('id', _$id, opt: true);
  static String? _$kr(LocalizedFieldValue v) => v.kr;
  static const Field<LocalizedFieldValue, String> _f$kr =
      Field('kr', _$kr, opt: true);
  static String? _$en(LocalizedFieldValue v) => v.en;
  static const Field<LocalizedFieldValue, String> _f$en =
      Field('en', _$en, opt: true);
  static String? _$cn(LocalizedFieldValue v) => v.cn;
  static const Field<LocalizedFieldValue, String> _f$cn =
      Field('cn', _$cn, opt: true);
  static String? _$jp(LocalizedFieldValue v) => v.jp;
  static const Field<LocalizedFieldValue, String> _f$jp =
      Field('jp', _$jp, opt: true);

  @override
  final MappableFields<LocalizedFieldValue> fields = const {
    #id: _f$id,
    #kr: _f$kr,
    #en: _f$en,
    #cn: _f$cn,
    #jp: _f$jp,
  };

  static LocalizedFieldValue _instantiate(DecodingData data) {
    return LocalizedFieldValue(
        id: data.dec(_f$id),
        kr: data.dec(_f$kr),
        en: data.dec(_f$en),
        cn: data.dec(_f$cn),
        jp: data.dec(_f$jp));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalizedFieldValue fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalizedFieldValue>(map);
  }

  static LocalizedFieldValue fromJsonString(String json) {
    return ensureInitialized().decodeJson<LocalizedFieldValue>(json);
  }
}

mixin LocalizedFieldValueMappable {
  String toJsonString() {
    return LocalizedFieldValueMapper.ensureInitialized()
        .encodeJson<LocalizedFieldValue>(this as LocalizedFieldValue);
  }

  Map<String, dynamic> toJson() {
    return LocalizedFieldValueMapper.ensureInitialized()
        .encodeMap<LocalizedFieldValue>(this as LocalizedFieldValue);
  }

  LocalizedFieldValueCopyWith<LocalizedFieldValue, LocalizedFieldValue,
          LocalizedFieldValue>
      get copyWith => _LocalizedFieldValueCopyWithImpl(
          this as LocalizedFieldValue, $identity, $identity);
  @override
  String toString() {
    return LocalizedFieldValueMapper.ensureInitialized()
        .stringifyValue(this as LocalizedFieldValue);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalizedFieldValueMapper.ensureInitialized()
                .isValueEqual(this as LocalizedFieldValue, other));
  }

  @override
  int get hashCode {
    return LocalizedFieldValueMapper.ensureInitialized()
        .hashValue(this as LocalizedFieldValue);
  }
}

extension LocalizedFieldValueValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalizedFieldValue, $Out> {
  LocalizedFieldValueCopyWith<$R, LocalizedFieldValue, $Out>
      get $asLocalizedFieldValue =>
          $base.as((v, t, t2) => _LocalizedFieldValueCopyWithImpl(v, t, t2));
}

abstract class LocalizedFieldValueCopyWith<$R, $In extends LocalizedFieldValue,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? kr, String? en, String? cn, String? jp});
  LocalizedFieldValueCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalizedFieldValueCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalizedFieldValue, $Out>
    implements LocalizedFieldValueCopyWith<$R, LocalizedFieldValue, $Out> {
  _LocalizedFieldValueCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalizedFieldValue> $mapper =
      LocalizedFieldValueMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? kr = $none,
          Object? en = $none,
          Object? cn = $none,
          Object? jp = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (kr != $none) #kr: kr,
        if (en != $none) #en: en,
        if (cn != $none) #cn: cn,
        if (jp != $none) #jp: jp
      }));
  @override
  LocalizedFieldValue $make(CopyWithData data) => LocalizedFieldValue(
      id: data.get(#id, or: $value.id),
      kr: data.get(#kr, or: $value.kr),
      en: data.get(#en, or: $value.en),
      cn: data.get(#cn, or: $value.cn),
      jp: data.get(#jp, or: $value.jp));

  @override
  LocalizedFieldValueCopyWith<$R2, LocalizedFieldValue, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalizedFieldValueCopyWithImpl($value, $cast, t);
}
