import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/user_address/user_address.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import 'blocs/address_cubit.dart';
import 'widgets/address_item.dart';

enum AddressType { management, selection }

class AddressManagementScreen extends StatelessWidget {
  const AddressManagementScreen(
      {this.initialAddressId, this.type = AddressType.management, super.key});
  final int? initialAddressId;
  final AddressType type;

  @override
  Widget build(BuildContext context) {
    const shimmerItem = AppShimmer(
      child: AddressItem(
        loading: true,
        addressType: AddressType.selection,
      ),
    );
    return BlocProvider(
      create: (context) {
        return AddressCubit(
          addressController: context.read<UserAddressController>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          selectedId: initialAddressId,
        );
      },
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: CommonAppBar(
            title: Text(S.of(context).changeAddress),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: InfiniteLoaderWrapper<AddressCubit, AddressState>.value(
                    value: context.read<AddressCubit>(),
                    builder: (BuildContext context, ScrollController controller,
                        AddressState state) {
                      final helper = InfiniteLoaderCalculatorHelper(state);
                      if (helper.firstLoadInProgress) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8)
                              .copyWith(left: 8),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return shimmerItem;
                          },
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<AddressCubit>().reload();
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8)
                              .copyWith(
                                  left:
                                      type == AddressType.management ? 18 : 8),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 24);
                          },
                          itemCount: helper.length,
                          itemBuilder: (context, index) {
                            return helper.renderItem(
                              context,
                              index,
                              loadingItemBuilder: (context) => shimmerItem,
                              itemBuilder: (context) {
                                final address = state.data[index];

                                return AddressItem(
                                    selectedAddressId: state.selectedAddressId,
                                    addressId: address.id,
                                    defaultAddress: address.isDefaults ?? false,
                                    addressName: address.mainAddress,
                                    details: address.detailAddress,
                                    username: address.name,
                                    addressType: type,
                                    onChanged: (value) async {
                                      if (address.id != null) {
                                        context.pop(address.id);
                                      }
                                    },
                                    onTapEdit: () async {
                                      if (address.id == null) {
                                        return;
                                      }
                                      final addressId =
                                          await AddressEditRouteData(
                                        addressId: address.id!,
                                      ).push<int>(context);
                                      if (!context.mounted) {
                                        return;
                                      }
                                      if (addressId != null) {
                                        context.read<AddressCubit>().reload();
                                      }
                                    });
                              },
                            );
                          },
                        ),
                      );
                    }),
              ),
              BottomButton(
                enableBorder: true,
                title: S.of(context).addShippingAddress,
                onPress: () async {
                  final addressId =
                      await const AddressAddRouteData().push<int>(context);
                  if (!context.mounted) {
                    return;
                  }
                  if (addressId != null) {
                    context.read<AddressCubit>().reload();
                  }
                },
                outlined: true,
              )
            ],
          ),
        );
      }),
    );
  }
}
