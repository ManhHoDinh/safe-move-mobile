import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'qa_filter_type.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum QAFilterType { all, yes, no }

String encodeQAFilterType(QAFilterType? self) {
  switch (self) {
    case QAFilterType.yes:
      return 'YES';
    case QAFilterType.no:
      return 'NO';
    case QAFilterType.all:
      return 'ALL';
    case null:
      return 'ALL';
  }
}
