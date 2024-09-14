import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'category_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum CategoryType { community, curator, sgmNews, store }
