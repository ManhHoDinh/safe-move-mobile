import 'package:dart_mappable/dart_mappable.dart';

part 'verify_otp_request.mapper.dart';

@MappableClass()
class VerifyOTPRequest with VerifyOTPRequestMappable {
  const VerifyOTPRequest({
    required this.otpSessionId,
    required this.otp,
  });

  final String otpSessionId;
  final String otp;
}
