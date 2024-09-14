import 'package:dart_mappable/dart_mappable.dart';

import '../../../user/dto/dto.dart';

part 'qa_response.mapper.dart';

@MappableClass()
class QAResponse with QAResponseMappable {
  const QAResponse({
    this.id,
    this.question,
    this.asker,
    this.answer,
    this.isHidden,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory QAResponse.fromJson(Map<String, dynamic> json) =>
      QAResponseMapper.fromJson(json);

  final int? id;
  final String? question;
  final UserDTO? asker;
  final String? answer;
  final bool? isHidden;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
