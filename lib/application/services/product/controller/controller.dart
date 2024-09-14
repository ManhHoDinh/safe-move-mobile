import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../product.dart';

mixin ProductController {
  Future<Result<Failure, PagingResponse<ProductResponse>>> getProducts({
    List<int>? categoryIds,
    int? page,
    required int size,
    String? keyword,
  });

  Future<Result<Failure, ProductResponse>> getProductById({
    required int id,
  });
}
