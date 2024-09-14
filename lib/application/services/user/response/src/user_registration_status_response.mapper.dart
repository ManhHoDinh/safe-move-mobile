// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_registration_status_response.dart';

class UserRegistrationStatusResponseMapper
    extends ClassMapperBase<UserRegistrationStatusResponse> {
  UserRegistrationStatusResponseMapper._();

  static UserRegistrationStatusResponseMapper? _instance;
  static UserRegistrationStatusResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UserRegistrationStatusResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserRegistrationStatusResponse';

  static bool? _$registrationCompleted(UserRegistrationStatusResponse v) =>
      v.registrationCompleted;
  static const Field<UserRegistrationStatusResponse, bool>
      _f$registrationCompleted =
      Field('registrationCompleted', _$registrationCompleted, opt: true);

  @override
  final MappableFields<UserRegistrationStatusResponse> fields = const {
    #registrationCompleted: _f$registrationCompleted,
  };

  static UserRegistrationStatusResponse _instantiate(DecodingData data) {
    return UserRegistrationStatusResponse(
        registrationCompleted: data.dec(_f$registrationCompleted));
  }

  @override
  final Function instantiate = _instantiate;

  static UserRegistrationStatusResponse fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserRegistrationStatusResponse>(map);
  }

  static UserRegistrationStatusResponse fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserRegistrationStatusResponse>(json);
  }
}

mixin UserRegistrationStatusResponseMappable {
  String toJsonString() {
    return UserRegistrationStatusResponseMapper.ensureInitialized()
        .encodeJson<UserRegistrationStatusResponse>(
            this as UserRegistrationStatusResponse);
  }

  Map<String, dynamic> toJson() {
    return UserRegistrationStatusResponseMapper.ensureInitialized()
        .encodeMap<UserRegistrationStatusResponse>(
            this as UserRegistrationStatusResponse);
  }

  UserRegistrationStatusResponseCopyWith<UserRegistrationStatusResponse,
          UserRegistrationStatusResponse, UserRegistrationStatusResponse>
      get copyWith => _UserRegistrationStatusResponseCopyWithImpl(
          this as UserRegistrationStatusResponse, $identity, $identity);
  @override
  String toString() {
    return UserRegistrationStatusResponseMapper.ensureInitialized()
        .stringifyValue(this as UserRegistrationStatusResponse);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserRegistrationStatusResponseMapper.ensureInitialized()
                .isValueEqual(this as UserRegistrationStatusResponse, other));
  }

  @override
  int get hashCode {
    return UserRegistrationStatusResponseMapper.ensureInitialized()
        .hashValue(this as UserRegistrationStatusResponse);
  }
}

extension UserRegistrationStatusResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserRegistrationStatusResponse, $Out> {
  UserRegistrationStatusResponseCopyWith<$R, UserRegistrationStatusResponse,
          $Out>
      get $asUserRegistrationStatusResponse => $base.as(
          (v, t, t2) => _UserRegistrationStatusResponseCopyWithImpl(v, t, t2));
}

abstract class UserRegistrationStatusResponseCopyWith<
    $R,
    $In extends UserRegistrationStatusResponse,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? registrationCompleted});
  UserRegistrationStatusResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserRegistrationStatusResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserRegistrationStatusResponse, $Out>
    implements
        UserRegistrationStatusResponseCopyWith<$R,
            UserRegistrationStatusResponse, $Out> {
  _UserRegistrationStatusResponseCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserRegistrationStatusResponse> $mapper =
      UserRegistrationStatusResponseMapper.ensureInitialized();
  @override
  $R call({Object? registrationCompleted = $none}) => $apply(FieldCopyWithData({
        if (registrationCompleted != $none)
          #registrationCompleted: registrationCompleted
      }));
  @override
  UserRegistrationStatusResponse $make(CopyWithData data) =>
      UserRegistrationStatusResponse(
          registrationCompleted: data.get(#registrationCompleted,
              or: $value.registrationCompleted));

  @override
  UserRegistrationStatusResponseCopyWith<$R2, UserRegistrationStatusResponse,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserRegistrationStatusResponseCopyWithImpl($value, $cast, t);
}
