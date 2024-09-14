import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../user_cart.dart';

mixin UserCartController {
  Future<Result<Failure, PagingResponse<CartResponse>>> getCarts({
    required int size,
    int? page,
  });

  Future<Result<Failure, CartResponse>> addCart(CartCreateRequest request);

  Future<Result<Failure, SuccessResponse>> deleteCart(
      {required CartDeleteRequest request});

  Future<Result<Failure, SuccessResponse>> deleteCartAll();

  Future<Result<Failure, CartResponse>> updateCart(
      {required String id, required CartUpdateRequest request});
}
