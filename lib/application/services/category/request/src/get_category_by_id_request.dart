import 'package:dart_mappable/dart_mappable.dart';

part 'get_category_by_id_request.mapper.dart';

@MappableClass()
class GetCategoryByIdRequest with GetCategoryByIdRequestMappable {
  const GetCategoryByIdRequest({
    required this.id,
  });

  final int id;
}
