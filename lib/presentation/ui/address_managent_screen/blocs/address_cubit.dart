import '../../../../application/services/user_address/user_address.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../../utilities/result/src/result.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

part 'address_state.dart';

class AddressCubit extends InfiniteLoaderCubit<AddressState, AddressResponse> {
  AddressCubit({
    required super.failureHandlerManager,
    required this.addressController,
    required this.selectedId,
  }) : super(initialState: AddressState(selectedAddressId: selectedId));

  final UserAddressController addressController;
  final int? selectedId;

  @override
  Future<Result<Failure, PageableData<AddressResponse>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    final result = await addressController.getAddresses(
      page: page,
      size: pageSize,
    );
    return result.mapResult(
      onLeft: (failure) => failure,
      onRight: (value) {
        final totalPages = value.totalPages ?? 0;
        final data = value.content ?? [];
        final totalItems = value.totalElements ?? 0;
        return PageableData(
          totalPages: totalPages,
          totalItems: totalItems,
          data: data,
        );
      },
    );
  }
}
