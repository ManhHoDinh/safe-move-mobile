import 'package:flutter/material.dart';

import '../../../../application/services/user_address/user_address.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/bloc_utils/safe_cubit/safe_cubit.dart';
import '../../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import 'upsert_address_state.dart';

class UpsertAddressCubit extends SafeCubit<UpsertAddressState> {
  UpsertAddressCubit({
    required this.userAddressController,
    required this.failureHandlerManager,
    required this.loadingManager,
    required this.mainAddressController,
    required this.zipCodeController,
    this.id,
  }) : super(UpsertAddressState(
          mainAddressController: mainAddressController,
          zipCodeController: zipCodeController,
        )) {
    if (id != null) {
      _getDetailAddress();
    }
  }

  final TextEditingController mainAddressController;
  final TextEditingController zipCodeController;
  final UserAddressController userAddressController;
  final FailureHandlerManager failureHandlerManager;
  final LoadingManager loadingManager;
  final int? id;

  void addAddress() async {
    final loadingCreateAddress =
        userAddressController.addAddress(AddressRequest(
      mainAddress: state.mainAddress.value,
      detailAddress: state.detailAddress.value,
      zipcode: state.zipCode.value,
      phoneNumber: state.phoneNumber.value,
      name: state.name.value,
      isDefaults: state.isDefault,
    ));

    final result =
        await loadingManager.startLoading(future: loadingCreateAddress);

    result.handleLeft((failure) {
      emit(state.copyWith(apiStatus: ApiStatus.fail));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      emit(state.copyWith(
          apiStatus: ApiStatus.success, addressIdCreated: value.id));
    });
  }

  void deleteAddress() {
    if (id == null) {
      return;
    }
    final loadingDeleteAddress =
        userAddressController.deleteAddressById(id: id!);

    loadingManager.startLoading(future: loadingDeleteAddress).then((result) {
      result.handleLeft((failure) {
        emit(state.copyWith(apiStatus: ApiStatus.fail));
        failureHandlerManager.handle(failure);
      });

      result.handleRight((value) {
        emit(state.copyWith(apiStatus: ApiStatus.success));
      });
    });
  }

  void updateAddress() {
    if (id == null) {
      return;
    }
    final loadingEditAddress = userAddressController.updateAddress(
        id: id!,
        request: AddressRequest(
          mainAddress: state.mainAddress.value,
          detailAddress: state.detailAddress.value,
          zipcode: state.zipCode.value,
          phoneNumber: state.phoneNumber.value,
          name: state.name.value,
          isDefaults: state.isDefault,
        ));

    loadingManager.startLoading(future: loadingEditAddress).then((result) {
      result.handleLeft((failure) {
        emit(state.copyWith(apiStatus: ApiStatus.fail));
        failureHandlerManager.handle(failure);
      });

      result.handleRight((value) {
        emit(state.copyWith(
            apiStatus: ApiStatus.success, addressIdCreated: value.id));
      });
    });
  }

  void _getDetailAddress() async {
    if (id == null) {
      return;
    }
    final result = await userAddressController.getAddressById(id: id!);

    result.handleLeft((failure) {
      emit(state.copyWith(statusGetDetailAddress: ApiStatus.fail));
      failureHandlerManager.handle(failure);
    });

    result.handleRight((value) {
      state.zipCodeController.text = value.zipcode ?? '';
      state.mainAddressController.text = value.mainAddress ?? '';

      emit(state.copyWith(
          zipCode: ZipCodeField.dirty(value: value.zipcode ?? ''),
          mainAddress: MainAddressField.dirty(value: value.mainAddress ?? ''),
          detailAddress:
              DetailAddressField.dirty(value: value.detailAddress ?? ''),
          phoneNumber: PhoneField.dirty(value: value.phoneNumber ?? ''),
          name: NameField.dirty(value: value.name ?? ''),
          isDefault: value.isDefaults ?? false,
          statusGetDetailAddress: ApiStatus.success,
          initialDefault: value.isDefaults ?? false));
    });
  }

  void setZipCodeAndMainAddress(String zipCode, String mainAddress) {
    state.zipCodeController.text = zipCode;
    state.mainAddressController.text = mainAddress;
    emit(state.copyWith(
        zipCode: ZipCodeField.dirty(value: zipCode),
        mainAddress: MainAddressField.dirty(value: mainAddress)));
  }

  void setDetailAddress(String detailAddress) {
    emit(state.copyWith(
        detailAddress: DetailAddressField.dirty(value: detailAddress)));
  }

  void setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: PhoneField.dirty(value: phoneNumber)));
  }

  void setName(String name) {
    emit(state.copyWith(name: NameField.dirty(value: name)));
  }

  void setIsDefault(bool isDefault) {
    emit(state.copyWith(isDefault: isDefault));
  }
}
