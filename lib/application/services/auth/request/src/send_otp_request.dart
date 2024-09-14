import 'package:dart_mappable/dart_mappable.dart';

part 'send_otp_request.mapper.dart';

@MappableClass()
class SendOTPRequest with SendOTPRequestMappable {
  const SendOTPRequest({
    required this.phoneNumber,
  });

  final String phoneNumber;
}
