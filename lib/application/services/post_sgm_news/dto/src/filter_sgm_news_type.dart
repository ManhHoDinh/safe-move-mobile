import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'filter_sgm_news_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum FilterSgmNewsType {
  POPULAR,
  LATEST,
}
