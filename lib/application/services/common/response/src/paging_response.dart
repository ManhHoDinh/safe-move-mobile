import 'package:dart_mappable/dart_mappable.dart';

part 'paging_response.mapper.dart';

@MappableClass()
class PagingResponse<T> with PagingResponseMappable<T> {
  const PagingResponse({
    this.totalPages,
    this.totalElements,
    this.content,
  });

  factory PagingResponse.fromJson(Map<String, dynamic> json) =>
      PagingResponseMapper.fromJson(json);

  final int? totalPages;
  final int? totalElements;
  final List<T>? content;
}
