import '../../../application/services/common/common.dart';
import '../../../application/services/product/product.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class ProductControllerImpl with ProductController, DataSourceErrorHandler {
  const ProductControllerImpl({
    required this.productDataSource,
  });

  final ProductDataSource productDataSource;

  @override
  Future<Result<Failure, PagingResponse<ProductResponse>>> getProducts(
      {List<int>? categoryIds, int? page, required int size, String? keyword}) {
    return handleApiResult(
      future: () => productDataSource.getProducts(
        categoryIds: categoryIds,
        page: page,
        size: size,
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<Failure, ProductResponse>> getProductById({required int id}) {
    return handleApiResult(
      future: () => productDataSource.getProductById(id: id),
    );
  }
}
