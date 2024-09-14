import '../../../application/services/common/common.dart';
import '../../../application/services/user_cart/user_cart.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserCartControllerImpl with UserCartController, DataSourceErrorHandler {
  UserCartControllerImpl({
    required this.userCartDataSource,
  });

  final UserCartDataSource userCartDataSource;

  @override
  Future<Result<Failure, PagingResponse<CartResponse>>> getCarts(
      {required int size, int? page}) {
    return handleApiResult(
        future: () => userCartDataSource.getCarts(size: size, page: page));
  }

  @override
  Future<Result<Failure, CartResponse>> addCart(CartCreateRequest request) {
    return handleApiResult(
        future: () => userCartDataSource.addCart(request: request));
  }

  @override
  Future<Result<Failure, CartResponse>> updateCart(
      {required String id, required CartUpdateRequest request}) {
    return handleApiResult(
        future: () => userCartDataSource.updateCart(id: id, request: request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteCart(
      {required CartDeleteRequest request}) {
    return handleApiResult(
        future: () => userCartDataSource.deleteCart(request: request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteCartAll() {
    return handleApiResult(future: userCartDataSource.deleteCartAll);
  }
}
