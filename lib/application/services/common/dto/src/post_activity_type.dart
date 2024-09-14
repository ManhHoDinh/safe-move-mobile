import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'post_activity_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum PostActivityType {
  POSTED,
  COMMENTED,
  LIKED,
}
