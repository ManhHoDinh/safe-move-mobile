import 'package:dart_mappable/dart_mappable.dart';

part 'term_and_cond_response.mapper.dart';

@MappableClass()
class TermAndCondResponse with TermAndCondResponseMappable {
  const TermAndCondResponse({
    this.id,
    this.createdAt,
    this.termType,
    this.contentKr,
    this.contentEn,
    this.contentCn,
    this.contentJp,
  });

  factory TermAndCondResponse.fromJson(Map<String, dynamic> json) =>
      TermAndCondResponseMapper.fromJson(json);

  final int? id;
  final String? createdAt;
  final String? termType;
  final String? contentKr;
  final String? contentEn;
  final String? contentCn;
  final String? contentJp;
}
