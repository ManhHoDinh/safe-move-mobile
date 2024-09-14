import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/file/file.dart';
import '../../../../utilities/logging/logging.dart';
import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/handlers/loading_handler/loading_manager.dart';
import '../../../shared/widgets/empty.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../../../utilities/request_login.dart';
import '../blocs/rating_cubit.dart';
import '../blocs/rating_state.dart';
import 'compose_section.dart';
import 'item_review.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({
    required this.productId,
    super.key,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    final shimmerItem = AppShimmer(
        child: ItemReview(
      name: '이름',
      createdAt: DateTime(2023, 3, 29),
      rating: 4,
      images: const [],
      loading: true,
    ));

    return BlocProvider<RatingCubit>(
      create: (context) {
        return RatingCubit(
          failureHandlerManager: context.read(),
          ratingController: context.read(),
          loadingManager: context.read<LoadingManager>(),
          productId: productId,
        );
      },
      child: BlocBuilder<RatingCubit, RatingState>(
        builder: (context, state) {
          final userState = context.watch<UserCubit>().state;
          final authState = context.watch<AuthCubit>().state;
          logging.e(userState.detail?.id);

          return Column(
            children: [
              _WriteReviewSection(
                productId: productId,
                total: state.totalItems,
              ),
              Expanded(
                child: InfiniteLoaderUnControlledWrapper<RatingCubit,
                        RatingState>.value(
                    value: context.read<RatingCubit>(),
                    builder: (BuildContext context, RatingState state) {
                      final helper = InfiniteLoaderCalculatorHelper(state);
                      if (helper.firstLoadInProgress) {
                        return ListView.separated(
                          itemCount: 100,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return shimmerItem;
                          },
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: 32,
                              color: AppColors.gray.shade100,
                              thickness: 1,
                            );
                          },
                        );
                      }
                      return LayoutBuilder(builder: (context, constraints) {
                        if (helper.firstLoadError) {
                          return helper.fullPageScrollable(context, constraints,
                              builder: (context) {
                            return TextCenter(title: S.of(context).someError);
                          });
                        }
                        if (helper.emptyResult) {
                          return helper.fullPageScrollable(context, constraints,
                              builder: (context) {
                            return const SizedBox.shrink();
                          });
                        }

                        return ListView.separated(
                          itemCount: helper.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
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
                                final dataRating = state.data[index];
                                final List<String> imagesUrl = [];
                                for (final FileResponse image
                                    in dataRating.images ?? []) {
                                  if (image.previewUrl != null) {
                                    imagesUrl.add(image.previewUrl!);
                                  }
                                }

                                return ItemReview(
                                  name: dataRating.writer?.name,
                                  createdAt:
                                      dataRating.createdAt ?? DateTime.now(),
                                  content: dataRating.content,
                                  avatarUrl: dataRating.writer?.avatarUrl,
                                  rating: dataRating.ratingPoint ?? 0,
                                  images: imagesUrl,
                                  isHidden: dataRating.isHidden ?? false,
                                  onAction: (action) async {
                                    if (action == ReviewAction.delete) {
                                      context
                                          .read<RatingCubit>()
                                          .deleteRating(index);
                                    }
                                  },
                                  isWriter:
                                      authState is AuthStatusLoggedInState &&
                                          userState.detail?.id ==
                                              dataRating.writer?.id,
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: 32,
                              color: AppColors.gray.shade100,
                              thickness: 1,
                            );
                          },
                        );
                      });
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WriteReviewSection extends StatelessWidget {
  const _WriteReviewSection({
    required this.productId,
    required this.total,
  });

  final int productId;
  final int total;

  @override
  Widget build(BuildContext context) {
    return ComposeSection(
      title: S.of(context).purchaseReview,
      buttonTitle: S.of(context).writeReply,
      onPressed: () async {
        final isLoggedIn = await requestLoginAction(context);

        if (!context.mounted && !isLoggedIn) {
          return;
        }
        final bool? success =
            await ComposeReviewRouteData(productId: productId).push(context);
        if (!context.mounted) {
          return;
        }
        if (success != null && success == true) {
          context.read<RatingCubit>().reload();
        }
      },
      onRefresh: () {
        context.read<RatingCubit>().reload();
      },
      count: total,
    );
  }
}
