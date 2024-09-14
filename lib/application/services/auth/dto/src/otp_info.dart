import 'package:dart_mappable/dart_mappable.dart';

import 'auth_method.dart';

part 'otp_info.mapper.dart';

@MappableClass()
class OTPInfo with OTPInfoMappable {
  const OTPInfo({
    this.address,
    this.type,
    this.expiredIn,
    this.otpSessionId,
  });

  factory OTPInfo.fromJson(Map<String, dynamic> json) =>
      OTPInfoMapper.fromJson(json);

  final String? otpSessionId;
  final AuthMethod? type;
  final String? address;
  final int? expiredIn;
}
