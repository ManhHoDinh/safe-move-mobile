import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/base_form_input/base_form_input.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';

enum UpsertAddressError {
  empty,
}

class ZipCodeField extends BaseFormInput<String, UpsertAddressError> {
  const ZipCodeField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const ZipCodeField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  UpsertAddressError? selfValidate() {
    if (value.trim().isEmpty) {
      return UpsertAddressError.empty;
    }
    return null;
  }
}

class MainAddressField extends BaseFormInput<String, UpsertAddressError> {
  const MainAddressField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const MainAddressField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  UpsertAddressError? selfValidate() {
    if (value.trim().isEmpty) {
      return UpsertAddressError.empty;
    }
    return null;
  }
}

class DetailAddressField extends BaseFormInput<String, UpsertAddressError> {
  const DetailAddressField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const DetailAddressField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  UpsertAddressError? selfValidate() {
    if (value.trim().isEmpty) {
      return UpsertAddressError.empty;
    }
    return null;
  }
}

class NameField extends BaseFormInput<String, UpsertAddressError> {
  const NameField.pure({super.value = ''})
      : super.pure(validateOnChanged: true);

  const NameField.dirty({required super.value})
      : super.dirty(validateOnChanged: true);

  @override
  UpsertAddressError? selfValidate() {
    if (value.trim().isEmpty) {
      return UpsertAddressError.empty;
    }
    return null;
  }
}

class UpsertAddressState extends Equatable {
  const UpsertAddressState({
    this.zipCode = const ZipCodeField.pure(),
    this.mainAddress = const MainAddressField.pure(),
    this.detailAddress = const DetailAddressField.pure(),
    this.phoneNumber = const PhoneField.pure(),
    this.name = const NameField.pure(),
    this.isDefault = false,
    this.apiStatus = ApiStatus.initial,
    this.statusGetDetailAddress = ApiStatus.initial,
    required this.zipCodeController,
    required this.mainAddressController,
    this.addressIdCreated,
    this.initialDefault = false,
  });

  final ZipCodeField zipCode;
  final MainAddressField mainAddress;
  final DetailAddressField detailAddress;
  final PhoneField phoneNumber;
  final NameField name;
  final bool isDefault;
  final bool initialDefault;
  final ApiStatus apiStatus;
  final ApiStatus statusGetDetailAddress;
  final TextEditingController zipCodeController;
  final TextEditingController mainAddressController;
  final int? addressIdCreated;

  bool get canSubmit {
    return zipCode.isValid &&
        mainAddress.isValid &&
        detailAddress.isValid &&
        phoneNumber.isValid &&
        name.isValid;
  }

  UpsertAddressState copyWith({
    ZipCodeField? zipCode,
    MainAddressField? mainAddress,
    DetailAddressField? detailAddress,
    PhoneField? phoneNumber,
    NameField? name,
    bool? isDefault,
    ApiStatus? apiStatus,
    ApiStatus? statusGetDetailAddress,
    int? addressIdCreated,
    bool? initialDefault,
  }) {
    return UpsertAddressState(
      zipCode: zipCode ?? this.zipCode,
      mainAddress: mainAddress ?? this.mainAddress,
      detailAddress: detailAddress ?? this.detailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
      apiStatus: apiStatus ?? this.apiStatus,
      zipCodeController: zipCodeController,
      mainAddressController: mainAddressController,
      statusGetDetailAddress:
          statusGetDetailAddress ?? this.statusGetDetailAddress,
      addressIdCreated: addressIdCreated ?? this.addressIdCreated,
      initialDefault: initialDefault ?? this.initialDefault,
    );
  }

  @override
  List<Object?> get props => [
        zipCode.value,
        zipCode.error,
        mainAddress.value,
        mainAddress.error,
        detailAddress.value,
        detailAddress.error,
        phoneNumber.value,
        phoneNumber.error,
        name.value,
        name.error,
        isDefault,
        apiStatus,
        statusGetDetailAddress,
        addressIdCreated,
        initialDefault,
      ];
}
