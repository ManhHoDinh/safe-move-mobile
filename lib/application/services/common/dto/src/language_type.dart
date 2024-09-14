import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'language_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum PostLanguage { KOREAN, ENGLISH, CHINESE, JAPANESE }
