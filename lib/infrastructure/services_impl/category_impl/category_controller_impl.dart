import '../../../application/services/category/category.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class CategoryControllerImpl with CategoryController, DataSourceErrorHandler {
  CategoryControllerImpl({
    required this.categoryDataSource,
  });

  final CategoryDataSource categoryDataSource;

  @override
  Future<Result<Failure, List<CategoryDTO>>> getAllCategory(
      GetAllCategoryRequest request) {
    return handleApiResult(
      future: () => categoryDataSource.getAllCategory(request),
    );
  }

  @override
  Future<Result<Failure, CategoryDTO>> getCategoryById(
      GetCategoryByIdRequest request) {
    return handleApiResult(
      future: () => categoryDataSource.getCategoryById(request.id),
    );
  }
}
