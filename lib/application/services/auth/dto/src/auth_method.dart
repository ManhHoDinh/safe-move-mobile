import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'auth_method.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum AuthMethod {
  phoneNumber,
  email,
  password,
}
