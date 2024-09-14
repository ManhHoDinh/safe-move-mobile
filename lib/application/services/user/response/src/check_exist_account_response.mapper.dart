// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'check_exist_account_response.dart';

class CheckAccountExistedResponseMapper
    extends ClassMapperBase<CheckAccountExistedResponse> {
  CheckAccountExistedResponseMapper._();

  static CheckAccountExistedResponseMapper? _instance;
  static CheckAccountExistedResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CheckAccountExistedResponseMapper._());
      AccountTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CheckAccountExistedResponse';

  static bool? _$existed(CheckAccountExistedResponse v) => v.existed;
  static const Field<CheckAccountExistedResponse, bool> _f$existed =
      Field('existed', _$existed);
  static AccountType? _$accountType(CheckAccountExistedResponse v) =>
      v.accountType;
  static const Field<CheckAccountExistedResponse, AccountType> _f$accountType =
      Field('accountType', _$accountType, opt: true);

  @override
  final MappableFields<CheckAccountExistedResponse> fields = const {
    #existed: _f$existed,
    #accountType: _f$accountType,
  };

  static CheckAccountExistedResponse _instantiate(DecodingData data) {
    return CheckAccountExistedResponse(
        existed: data.dec(_f$existed), accountType: data.dec(_f$accountType));
  }

  @override
  final Function instantiate = _instantiate;

  static CheckAccountExistedResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CheckAccountExistedResponse>(map);
  }

  static CheckAccountExistedResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<CheckAccountExistedResponse>(json);
  }
}

mixin CheckAccountExistedResponseMappable {
  String toJsonString() {
    return CheckAccountExistedResponseMapper.ensureInitialized()
        .encodeJson<CheckAccountExistedResponse>(
            this as CheckAccountExistedResponse);
  }

  Map<String, dynamic> toJson() {
    return CheckAccountExistedResponseMapper.ensureInitialized()
        .encodeMap<CheckAccountExistedResponse>(
            this as CheckAccountExistedResponse);
  }

  CheckAccountExistedResponseCopyWith<CheckAccountExistedResponse,
          CheckAccountExistedResponse, CheckAccountExistedResponse>
      get copyWith => _CheckAccountExistedResponseCopyWithImpl(
          this as CheckAccountExistedResponse, $identity, $identity);
  @override
  String toString() {
    return CheckAccountExistedResponseMapper.ensureInitialized()
        .stringifyValue(this as CheckAccountExistedResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CheckAccountExistedResponseMapper.ensureInitialized()
                .isValueEqual(this as CheckAccountExistedResponse, other));
  }

  @override
  int get hashCode {
    return CheckAccountExistedResponseMapper.ensureInitialized()
        .hashValue(this as CheckAccountExistedResponse);
  }
}

extension CheckAccountExistedResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckAccountExistedResponse, $Out> {
  CheckAccountExistedResponseCopyWith<$R, CheckAccountExistedResponse, $Out>
      get $asCheckAccountExistedResponse => $base
          .as((v, t, t2) => _CheckAccountExistedResponseCopyWithImpl(v, t, t2));
}

abstract class CheckAccountExistedResponseCopyWith<
    $R,
    $In extends CheckAccountExistedResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? existed, AccountType? accountType});
  CheckAccountExistedResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CheckAccountExistedResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckAccountExistedResponse, $Out>
    implements
        CheckAccountExistedResponseCopyWith<$R, CheckAccountExistedResponse,
            $Out> {
  _CheckAccountExistedResponseCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckAccountExistedResponse> $mapper =
      CheckAccountExistedResponseMapper.ensureInitialized();
  @override
  $R call({Object? existed = $none, Object? accountType = $none}) =>
      $apply(FieldCopyWithData({
        if (existed != $none) #existed: existed,
        if (accountType != $none) #accountType: accountType
      }));
  @override
  CheckAccountExistedResponse $make(CopyWithData data) =>
      CheckAccountExistedResponse(
          existed: data.get(#existed, or: $value.existed),
          accountType: data.get(#accountType, or: $value.accountType));

  @override
  CheckAccountExistedResponseCopyWith<$R2, CheckAccountExistedResponse, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CheckAccountExistedResponseCopyWithImpl($value, $cast, t);
}
