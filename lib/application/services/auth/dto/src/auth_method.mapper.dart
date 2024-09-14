// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_method.dart';

class AuthMethodMapper extends EnumMapper<AuthMethod> {
  AuthMethodMapper._();

  static AuthMethodMapper? _instance;
  static AuthMethodMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthMethodMapper._());
    }
    return _instance!;
  }

  static AuthMethod fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthMethod decode(dynamic value) {
    switch (value) {
      case 'PHONE_NUMBER':
        return AuthMethod.phoneNumber;
      case 'EMAIL':
        return AuthMethod.email;
      case 'PASSWORD':
        return AuthMethod.password;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthMethod self) {
    switch (self) {
      case AuthMethod.phoneNumber:
        return 'PHONE_NUMBER';
      case AuthMethod.email:
        return 'EMAIL';
      case AuthMethod.password:
        return 'PASSWORD';
    }
  }
}

extension AuthMethodMapperExtension on AuthMethod {
  String toValue() {
    AuthMethodMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AuthMethod>(this) as String;
  }
}
