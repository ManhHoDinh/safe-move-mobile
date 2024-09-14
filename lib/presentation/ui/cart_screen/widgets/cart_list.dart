import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bases/cart_cubit/cart_cubit.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/empty.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import 'cart_item_handler.dart';
import 'cart_product_item.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final shimmerItem = AppShimmer(
    child: CartProductItem(
      selected: true,
      title: '아임 약콩 두유 190ml x 60포아임 약콩 두유 190ml x 60포아임 약콩 두유 190ml x 60포',
      pricePerUnit: 90000,
      onDeletePressed: () {},
      loading: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return InfiniteLoaderWrapper<CartCubit, CartState>.value(
      value: context.read<CartCubit>(),
      builder:
          (BuildContext context, ScrollController controller, CartState state) {
        final helper = InfiniteLoaderCalculatorHelper(state, loadingOffset: 2);
        if (helper.firstLoadInProgress) {
          return ListView.separated(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return shimmerItem;
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 14),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            if (helper.firstLoadError) {
              return helper.fullPageScrollable(context, constraints,
                  builder: (context) {
                return TextCenter(title: S.of(context).someError);
              });
            }
            if (helper.emptyResult) {
              return helper.fullPageScrollable(context, constraints,
                  builder: (context) {
                return TextCenter(
                  title: S.of(context).emptyList,
                );
              });
            }

            return AnimatedList(
              initialItemCount: state.totalItems == state.productList.length
                  ? state.productList.length
                  : state.productList.length + 1,
              key: state.listKey,
              controller: controller,
              itemBuilder: (context, index, animation) {
                return helper.renderItem(
                  context,
                  index,
                  loadingItemBuilder: (context) => shimmerItem,
                  errorItemBuilder: (context) {
                    return const InfiniteLoadingListItemError();
                  },
                  itemBuilder: (context) {
                    final cartItemHandler = CartItemHandler(
                      state: state,
                      context: context,
                      constraints: constraints,
                    );
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: cartItemHandler.handleCartItems(index),
                    );
                  },
                );
              },
              // separatorBuilder: (context, index) =>
              //     const SizedBox(height: 14),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            );
          },
        );
      },
    );
  }
}
