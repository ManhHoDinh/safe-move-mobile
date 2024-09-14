import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/result.dart';
import '../../common/common.dart';
import '../request/request.dart';
import '../response/response.dart';

mixin UserAddressController {
  Future<Result<Failure, PagingResponse<AddressResponse>>> getAddresses(
      {int? page, required int size});

  Future<Result<Failure, AddressResponse>> addAddress(AddressRequest request);
  Future<Result<Failure, AddressResponse>> getAddressById({required int id});
  Future<Result<Failure, AddressResponse>> updateAddress(
      {required int id, required AddressRequest request});
  Future<Result<Failure, SuccessResponse>> deleteAddressById({required int id});
}
