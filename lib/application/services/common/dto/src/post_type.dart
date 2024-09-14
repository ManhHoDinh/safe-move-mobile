import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'post_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum PostType { COMMUNITY, CURATOR, SGM_NEWS }
