import '../../../application/services/common/response/src/paging_response.dart';
import '../../../application/services/common/response/src/success_response.dart';
import '../../../application/services/user_address/controller/controller.dart';
import '../../../application/services/user_address/request/src/address_request.dart';
import '../../../application/services/user_address/response/src/address_response.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/src/result.dart';
import '../../data_source_error_handler_mixin.dart';
import 'data_source.dart';

class UserAddressControllerImpl
    with UserAddressController, DataSourceErrorHandler {
  const UserAddressControllerImpl({
    required this.userAddressDataSource,
  });

  final UserAddressDataSource userAddressDataSource;

  @override
  Future<Result<Failure, PagingResponse<AddressResponse>>> getAddresses(
      {int? page, required int size}) {
    return handleApiResult(
        future: () =>
            userAddressDataSource.getAddresses(page: page, size: size));
  }

  @override
  Future<Result<Failure, AddressResponse>> addAddress(AddressRequest request) {
    return handleApiResult(
        future: () => userAddressDataSource.addAddress(request));
  }

  @override
  Future<Result<Failure, AddressResponse>> getAddressById({required int id}) {
    return handleApiResult(
        future: () => userAddressDataSource.getAddressById(id: id));
  }

  @override
  Future<Result<Failure, AddressResponse>> updateAddress(
      {required int id, required AddressRequest request}) {
    return handleApiResult(
        future: () =>
            userAddressDataSource.updateAddress(id: id, request: request));
  }

  @override
  Future<Result<Failure, SuccessResponse>> deleteAddressById(
      {required int id}) {
    return handleApiResult(
        future: () => userAddressDataSource.deleteAddressById(id: id));
  }
}
