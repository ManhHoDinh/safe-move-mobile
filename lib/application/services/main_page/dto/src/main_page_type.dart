import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'main_page_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum MainPageType { MAIN, BEST_CONTENT, ONLINE_MAGAZINE, BEST_REVIEW, SGM_NEWS }
