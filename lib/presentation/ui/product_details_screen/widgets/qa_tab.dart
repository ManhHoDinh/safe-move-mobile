import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/empty.dart';
import '../../../utilities/request_login.dart';
import '../blocs/qa_cubit.dart';
import '../blocs/qa_state.dart';
import 'compose_section.dart';
import 'qa_item.dart';

class QATab extends StatelessWidget {
  const QATab({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    final shimmerItem = AppShimmer(
      child: QAItem(
        asker: '홍길동',
        category: '상품문의',
        question:
            '문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 ',
        answer:
            '문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 문의질문 ',
        answerDate: DateTime.now(),
        askDate: DateTime.now(),
        loading: true,
      ),
    );
    return BlocProvider<QACubit>(
      create: (context) {
        return QACubit(
          failureHandlerManager: context.read(),
          qAController: context.read(),
          productId: productId,
        );
      },
      child: BlocBuilder<QACubit, QAState>(
        builder: (context, state) {
          return Column(
            children: [
              _WriteQASection(
                productId: productId,
                total: state.totalItems,
              ),
              Expanded(
                child:
                    InfiniteLoaderUnControlledWrapper<QACubit, QAState>.value(
                        value: context.read<QACubit>(),
                        builder: (BuildContext context, QAState state) {
                          final helper = InfiniteLoaderCalculatorHelper(state);
                          if (helper.firstLoadInProgress) {
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return shimmerItem;
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 32,
                                  color: AppColors.gray.shade100,
                                  thickness: 1,
                                );
                              },
                            );
                          }

                          return LayoutBuilder(
                            builder: (context, constraints) {
                              if (helper.firstLoadError) {
                                return helper.fullPageScrollable(
                                    context, constraints, builder: (context) {
                                  return TextCenter(
                                      title: S.of(context).someError);
                                });
                              }
                              if (helper.emptyResult) {
                                return helper.fullPageScrollable(
                                  context,
                                  constraints,
                                  builder: (context) {
                                    return const SizedBox.shrink();
                                  },
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: helper.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return helper.renderItem(
                                    context,
                                    index,
                                    loadingItemBuilder: (context) {
                                      return shimmerItem;
                                    },
                                    errorItemBuilder: (context) {
                                      return TextCenter(
                                          title: S.of(context).someError);
                                    },
                                    itemBuilder: (context) {
                                      final dataQA = state.data[index];
                                      return QAItem(
                                        asker: dataQA.asker?.name,
                                        category: dataQA.type ?? '',
                                        question: dataQA.question,
                                        answer: dataQA.answer,
                                        answerDate: dataQA.updatedAt,
                                        askDate:
                                            dataQA.createdAt ?? DateTime.now(),
                                        locked: dataQA.isHidden ?? false,
                                      );
                                    },
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    height: 32,
                                    color: AppColors.gray.shade100,
                                    thickness: 1,
                                  );
                                },
                              );
                            },
                          );
                        }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WriteQASection extends StatelessWidget {
  const _WriteQASection({
    required this.productId,
    required this.total,
  });

  final int productId;
  final int total;

  @override
  Widget build(BuildContext context) {
    return ComposeSection(
      title: S.of(context).inquiry,
      buttonTitle: S.of(context).writeQA,
      onPressed: () async {
        final isLoggedIn = await requestLoginAction(context);

        if (!context.mounted && !isLoggedIn) {
          return;
        }
        final isSuccess =
            await ComposeQARouteData(productId: productId).push(context);
        if (!context.mounted) {
          return;
        }

        if (isSuccess == true) {
          context.read<QACubit>().reload();
        }
      },
      count: total,
      onRefresh: () {
        context.read<QACubit>().reload();
      },
    );
  }
}
