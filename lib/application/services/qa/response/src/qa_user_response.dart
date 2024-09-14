import 'package:dart_mappable/dart_mappable.dart';

import '../../../product/product.dart';
import '../../../user/dto/dto.dart';

part 'qa_user_response.mapper.dart';

@MappableClass()
class QAUserResponse with QAUserResponseMappable {
  const QAUserResponse({
    this.id,
    this.question,
    this.asker,
    this.answer,
    this.isHidden,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.productResponse,
  });

  factory QAUserResponse.fromJson(Map<String, dynamic> json) =>
      QAUserResponseMapper.fromJson(json);

  final int? id;
  final String? question;
  final UserDTO? asker;
  final String? answer;
  final bool? isHidden;
  final String? type;
  final ProductResponse? productResponse;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
