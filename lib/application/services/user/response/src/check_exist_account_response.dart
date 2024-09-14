import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/dto.dart';

part 'check_exist_account_response.mapper.dart';

@MappableClass()
class CheckAccountExistedResponse with CheckAccountExistedResponseMappable {
  const CheckAccountExistedResponse({
    required this.existed,
    this.accountType,
  });

  factory CheckAccountExistedResponse.fromJson(Map<String, dynamic> json) =>
      CheckAccountExistedResponseMapper.fromJson(json);

  final bool? existed;
  final AccountType? accountType;
}
