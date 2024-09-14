import 'package:dart_mappable/dart_mappable.dart';

import '../../auth.dart';

part 'send_otp_response.mapper.dart';

@MappableClass()
class SendOTPResponse with SendOTPResponseMappable {
  const SendOTPResponse({
    this.otpSessionId,
    this.type,
    this.address,
    this.expiredIn,
  });

  factory SendOTPResponse.fromJson(Map<String, dynamic> json) =>
      SendOTPResponseMapper.fromJson(json);

  final String? otpSessionId;
  final AuthMethod? type;
  final String? address;
  final int? expiredIn;
}
