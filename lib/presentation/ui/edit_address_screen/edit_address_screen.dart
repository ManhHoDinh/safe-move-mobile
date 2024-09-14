import 'package:daum_postcode_search/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/user_address/user_address.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_switches/app_checkbox_title.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../shared/widgets/textfields/button_textfield.dart';
import '../../shared/widgets/textfields/common_textfield.dart';
import 'blocs/upsert_address_cubit.dart';
import 'blocs/upsert_address_state.dart';

enum AddressScreenOperation {
  add,
  edit,
}

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({
    super.key,
    required this.type,
    this.id,
  });

  final AddressScreenOperation type;
  final int? id;

  String? renderUpsertAddressError(
      BuildContext context, UpsertAddressError? error) {
    if (error == null) {
      return null;
    }
    switch (error) {
      case UpsertAddressError.empty:
        return S.of(context).empty;
    }
  }

  Widget _shimmerItem() {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpsertAddressCubit>(
      create: (context) => UpsertAddressCubit(
        failureHandlerManager: context.read<FailureHandlerManager>(),
        userAddressController: context.read<UserAddressController>(),
        loadingManager: context.read<LoadingManager>(),
        mainAddressController: TextEditingController(),
        zipCodeController: TextEditingController(),
        id: id,
      ),
      child: BlocListener<UpsertAddressCubit, UpsertAddressState>(
        listener: (context, state) {
          if (state.apiStatus == ApiStatus.success) {
            context.pop(state.addressIdCreated ?? 0);
          }
        },
        child: BlocBuilder<UpsertAddressCubit, UpsertAddressState>(
          buildWhen: (previous, current) =>
              previous.statusGetDetailAddress != current.statusGetDetailAddress,
          builder: (context, state) {
            final loading = type == AddressScreenOperation.edit &&
                (state.statusGetDetailAddress == ApiStatus.loading ||
                    state.statusGetDetailAddress == ApiStatus.initial);
            return Scaffold(
              appBar: CommonAppBar(
                title: Text(S.of(context).addShippingAddress),
                centerTitle: true,
              ),
              body: AppShimmer(
                enabled: loading,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (loading)
                              _shimmerItem()
                            else
                              BlocBuilder<UpsertAddressCubit,
                                      UpsertAddressState>(
                                  buildWhen: (previous, current) =>
                                      previous.name.value != current.name.value,
                                  builder: (context, state) {
                                    return CommonTextField(
                                      hintText:
                                          S.of(context).recipient, // receiver
                                      onChanged: (value) => context
                                          .read<UpsertAddressCubit>()
                                          .setName(value),
                                      initialValue: state.name.value,
                                      errorText: renderUpsertAddressError(
                                          context, state.name.displayError),
                                    );
                                  }),
                            const SizedBox(height: 16),
                            if (loading)
                              _shimmerItem()
                            else
                              BlocBuilder<UpsertAddressCubit,
                                      UpsertAddressState>(
                                  buildWhen: (previous, current) =>
                                      previous.phoneNumber !=
                                      current.phoneNumber,
                                  builder: (context, state) {
                                    return CommonTextField(
                                      hintText: S
                                          .of(context)
                                          .placeHolderPhone, // phone number
                                      onChanged: (value) {
                                        context
                                            .read<UpsertAddressCubit>()
                                            .setPhoneNumber(value);
                                      },
                                      keyboardType: TextInputType.phone,
                                      initialValue: state.phoneNumber.value,
                                      errorText: renderPhoneError(context,
                                          state.phoneNumber.displayError),
                                    );
                                  }),
                            const SizedBox(height: 16),
                            BlocBuilder<UpsertAddressCubit, UpsertAddressState>(
                                buildWhen: (previous, current) =>
                                    previous.zipCode != current.zipCode,
                                builder: (context, state) {
                                  return ButtonTextField(
                                    buttonTitle:
                                        S.of(context).checkAddressSearch,
                                    hintText: S.of(context).address,
                                    enableTextField: false,
                                    textEditingController:
                                        state.zipCodeController,
                                    onSubmit: (value) async {
                                      final DataModel? model =
                                          await const SearchAddressRouteData()
                                              .push(context);
                                      if (!context.mounted) {
                                        return;
                                      }
                                      if (model?.zonecode != null &&
                                          model?.address != null) {
                                        context
                                            .read<UpsertAddressCubit>()
                                            .setZipCodeAndMainAddress(
                                                model!.zonecode, model.address);
                                      }
                                    },
                                  );
                                }),
                            const SizedBox(height: 8),
                            BlocBuilder<UpsertAddressCubit, UpsertAddressState>(
                                buildWhen: (previous, current) =>
                                    previous.mainAddress != current.mainAddress,
                                builder: (context, state) {
                                  return CommonTextField(
                                    enable: false,
                                    textEditingController:
                                        state.mainAddressController,
                                    errorText: renderUpsertAddressError(context,
                                        state.mainAddress.displayError),
                                  );
                                }),
                            const SizedBox(height: 8),
                            if (loading)
                              _shimmerItem()
                            else
                              BlocBuilder<UpsertAddressCubit,
                                      UpsertAddressState>(
                                  buildWhen: (previous, current) =>
                                      previous.detailAddress !=
                                      current.detailAddress,
                                  builder: (context, state) {
                                    return CommonTextField(
                                      hintText:
                                          S.of(context).enterDetailedAddress,
                                      onChanged: (value) => context
                                          .read<UpsertAddressCubit>()
                                          .setDetailAddress(value),
                                      initialValue: state.detailAddress.value,
                                      errorText: renderUpsertAddressError(
                                          context,
                                          state.detailAddress.displayError),
                                    );
                                  }),
                            const SizedBox(height: 8),
                            BlocBuilder<UpsertAddressCubit, UpsertAddressState>(
                                buildWhen: (previous, current) =>
                                    previous.isDefault != current.isDefault,
                                builder: (context, state) {
                                  return AppCheckBoxTitle(
                                      value: state.initialDefault == true
                                          ? state.initialDefault
                                          : state.isDefault,
                                      title:
                                          Text(S.of(context).setDefaultAddress),
                                      onChanged: (value) {
                                        if (state.initialDefault == false) {
                                          context
                                              .read<UpsertAddressCubit>()
                                              .setIsDefault(value);
                                        }
                                      });
                                })
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<UpsertAddressCubit, UpsertAddressState>(
                        builder: (context, state) {
                      return Row(
                        children: [
                          if (type == AddressScreenOperation.edit &&
                              state.initialDefault == false)
                            Expanded(
                              child: BottomButton(
                                enableBorder: true,
                                outlined: true,
                                borderActiveColor: AppColors.red.shade600,
                                title: S.of(context).delete,
                                textStyle: Styles.s15()
                                    .withLetterSpacing(-2.5 / 100)
                                    .withWeight(FontWeight.w600)
                                    .withColor(AppColors.red.shade600),
                                onPress: () async {
                                  if (id != null) {
                                    final checked = await ConfirmRouteData(
                                                content: S
                                                    .of(context)
                                                    .areYouSureYouWantToDelete)
                                            .push<bool>(context) ??
                                        false;
                                    if (checked && context.mounted) {
                                      context
                                          .read<UpsertAddressCubit>()
                                          .deleteAddress();
                                    }
                                  }
                                },
                              ),
                            ),
                          Expanded(
                            child: BottomButton(
                              enableBorder: true,
                              onPress: state.canSubmit
                                  ? () {
                                      if (type == AddressScreenOperation.add) {
                                        context
                                            .read<UpsertAddressCubit>()
                                            .addAddress();
                                      } else {
                                        if (id != null) {
                                          context
                                              .read<UpsertAddressCubit>()
                                              .updateAddress();
                                        }
                                      }
                                    }
                                  : null,
                              title: S.of(context).add,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
