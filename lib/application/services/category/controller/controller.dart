import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../category.dart';

mixin CategoryController {
  Future<Result<Failure, List<CategoryDTO>>> getAllCategory(
    GetAllCategoryRequest request,
  );

  Future<Result<Failure, CategoryDTO>> getCategoryById(
    GetCategoryByIdRequest request,
  );
}
