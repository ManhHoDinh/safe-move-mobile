import 'package:dart_mappable/dart_mappable.dart';

import '../../dto/src/category_type.dart';

part 'get_all_category_request.mapper.dart';

@MappableClass()
class GetAllCategoryRequest with GetAllCategoryRequestMappable {
  const GetAllCategoryRequest({
    required this.include,
  });

  final List<CategoryType> include;
}
