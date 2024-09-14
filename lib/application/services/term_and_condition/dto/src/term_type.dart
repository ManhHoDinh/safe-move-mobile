import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'term_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum TermType { TERM_OF_SERVICE, TERM_AND_COND, MALL_TERMS_OF_USE }
