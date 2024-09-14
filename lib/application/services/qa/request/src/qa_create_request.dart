import 'package:dart_mappable/dart_mappable.dart';

import '../../../../../utilities/constants/constants.dart';

part 'qa_create_request.mapper.dart';

@MappableEnum(caseStyle: enumCaseStyle)
enum QAType {all, product, delivery, return_refund, cancel, exchange, other }

@MappableClass()
class QACreateRequest with QACreateRequestMappable {
  const QACreateRequest({
    required this.productId,
    required this.question,
    required this.type,
  });

  final int productId;
  final String question;
  final QAType type;
}
