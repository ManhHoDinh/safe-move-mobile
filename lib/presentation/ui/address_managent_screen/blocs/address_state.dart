part of 'address_cubit.dart';

class AddressState extends InfiniteLoaderState<AddressResponse> {
  const AddressState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    required this.selectedAddressId,
  });

  final int? selectedAddressId;

  AddressState copyWith({
    int? selectedAddressId,
  }) {
    return AddressState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      isFirstLoad: isFirstLoad,
      totalItems: totalItems,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
    );
  }

  @override
  InfiniteLoaderState<AddressResponse> loadingManagementStateChanged({
    List<AddressResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return AddressState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      selectedAddressId: selectedAddressId,
    );
  }
}
