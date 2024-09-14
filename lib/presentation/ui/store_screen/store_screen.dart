import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/category/category.dart';
import '../../../application/services/product/product.dart';
import '../../bases/cart_cubit/cart_cubit.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../shared/widgets/app_search_bar/app_search_bar.dart';
import '../../utilities/request_login.dart';
import 'blocs/store_cubit.dart';
import 'widgets/products_layout.dart';
import 'widgets/store_filter.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const StoreScreen(),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return CustomTransitionBuilder.noTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoreCubit>(
      lazy: false,
      create: (BuildContext context) {
        return StoreCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          categoryController: context.read<CategoryController>(),
          productController: context.read<ProductController>(),
        );
      },
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppSearchBar(
            title: Text(S.of(context).store),
            onQuery: (value) {
              context.read<StoreCubit>().search(value);
            },
            actions: [
              AppIconButton(
                icon: Assets.svgs.cartIcon.svg(),
                notificationCount:
                    context.watch<CartCubit>().state.totalItems == 0
                        ? null
                        : context.watch<CartCubit>().state.totalItems,
                onTap: () async {
                  final isLoggedIn = await requestLoginAction(context);
                  if (!context.mounted) {
                    return;
                  }
                  if (isLoggedIn) {
                    await const CartRouteData().push(context);
                    if (!context.mounted) {
                      return;
                    }

                    context.read<CartCubit>().reload();
                  }
                },
              ),
            ],
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                StoreFilter(),
                SizedBox(height: 20),
                Expanded(
                  child: ProductsLayout(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
