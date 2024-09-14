import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/empty.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../../shared/widgets/item_divider.dart';
import '../../../utilities/category_name_resolver.dart';
import '../blocs/inquiry_history_cubit.dart';
import '../blocs/inquiry_history_state.dart';
import 'qa_item.dart';

class QAList extends StatelessWidget {
  const QAList({super.key});

  @override
  Widget build(BuildContext context) {
    const shimmerItem = AppShimmer(
        child: QAItemExpand(
      loading: true,
    ));
    return BlocBuilder<InquiryHistoryCubit, InquiryHistoryState>(
        builder: (context, state) {
      return InfiniteLoaderWrapper<InquiryHistoryCubit,
              InquiryHistoryState>.value(
          value: context.read<InquiryHistoryCubit>(),
          builder: (BuildContext context, ScrollController controller,
              InquiryHistoryState state) {
            final helper = InfiniteLoaderCalculatorHelper(state);
            if (helper.firstLoadInProgress) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return shimmerItem;
                },
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const ItemDivider(
                    padding: EdgeInsets.symmetric(vertical: 18)),
                itemCount: 10,
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<InquiryHistoryCubit>().reload();
              },
              child: LayoutBuilder(builder: (context, constraints) {
                if (helper.firstLoadError) {
                  return helper.fullPageScrollable(context, constraints,
                      builder: (context) {
                    return TextCenter(title: S.of(context).someError);
                  });
                }
                if (helper.emptyResult) {
                  return helper.fullPageScrollable(
                    context,
                    constraints,
                    builder: (context) {
                      return TextCenter(title: S.of(context).emptyList);
                    },
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return helper.renderItem(
                      context,
                      index,
                      loadingItemBuilder: (context) {
                        return shimmerItem;
                      },
                      errorItemBuilder: (context) {
                        return const InfiniteLoadingListItemError();
                      },
                      itemBuilder: (context) {
                        final data = state.data[index];
                        return QAItemExpand(
                          answer: data.answer,
                          question: data.question,
                          productImage:
                              data.productResponse?.images?.first.previewUrl,
                          productTitle: resolveFieldValueName(
                              context, data.productResponse?.title),
                          onTitleTap: () {
                            if (data.productResponse?.id != null) {
                              ProductDetailsRouteData(
                                productId: data.productResponse!.id!,
                              ).push(context);
                            }
                          },
                          type: data.type,
                        );
                      },
                    );
                  },
                  itemCount: helper.length,
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const ItemDivider(
                      padding: EdgeInsets.only(top: 12, bottom: 16),
                    );
                  },
                );
              }),
            );
          });
    });
  }
}
