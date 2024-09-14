import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/product/product.dart';
import '../../../application/services/qa/qa.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/routes_gen/routes_gen.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../../shared/widgets/ordered_product_item.dart';
import '../../utilities/category_name_resolver.dart';
import '../product_details_screen/blocs/product_detail_cubit.dart';
import '../product_details_screen/blocs/product_detail_state.dart';
import 'blocs/compose_qa_cubit.dart';
import 'blocs/compose_qa_state.dart';
import 'widgets/qa_category_selection_section.dart';
import 'widgets/qa_text_box_section.dart';

class ComposeQAScreen extends StatelessWidget {
  const ComposeQAScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ComposeQACubit>(
          create: (BuildContext context) {
            return ComposeQACubit(
              productId: productId,
              failureHandlerManager: context.read<FailureHandlerManager>(),
              loadingManager: context.read<LoadingManager>(),
              qAController: context.read<QAController>(),
            );
          },
        ),
        BlocProvider(create: (BuildContext context) {
          return ProductDetailCubit(
            productController: context.read<ProductController>(),
            failureHandlerManager: context.read<FailureHandlerManager>(),
            id: productId,
          );
        }),
      ],
      child: Builder(builder: (context) {
        return BlocListener<ComposeQACubit, ComposeQAState>(
          listenWhen: (prev, cur) {
            return prev.isSuccess != cur.isSuccess;
          },
          listener: (BuildContext context, ComposeQAState state) {
            if (state.isSuccess && context.mounted) {
              context.pop(true);
            }
          },
          child: Scaffold(
            appBar: CommonAppBar(
              title: Text(S.of(context).composeQA),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<ProductDetailCubit, ProductDetailState>(
                          builder: (context, state) {
                            final ProductResponse productData =
                                state.productResponse;

                            return state.loading
                                ? const AppShimmer(
                                    child: OrderedProductItem(
                                      size: 48,
                                      loading: true,
                                    ),
                                  )
                                : OrderedProductItem(
                                    size: 48,
                                    productImage:
                                        productData.images?.first.previewUrl,
                                    productName: resolveFieldValueName(
                                        context, productData.title));
                          },
                        ),
                        const SizedBox(height: 32),
                        const QACategorySelectionSection(),
                        const SizedBox(height: 32),
                        const QATextBoxSection(),
                      ],
                    ),
                  ),
                ),
                BottomButton(
                  enableBorder: true,
                  title: S.of(context).submitQA,
                  onPress: () async {
                    final agreed = await ConfirmRouteData(
                            content: S.of(context).wouldYouLikeSendAnInquiry)
                        .push<bool>(context);

                    if (agreed == null) {
                      return;
                    }
                    if (agreed == true && context.mounted) {
                      context.read<ComposeQACubit>().onSubmit();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
