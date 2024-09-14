import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/file/file.dart';
import '../../../application/services/rating/rating.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/routes_gen/routes_gen.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import 'blocs/compose_review_cubit.dart';
import 'blocs/compose_review_state.dart';
import 'widgets/rating_section.dart';
import 'widgets/review_text_box_section.dart';
import 'widgets/select_image_section.dart';

class ComposeReviewScreen extends StatelessWidget {
  const ComposeReviewScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComposeReviewCubit>(
      create: (context) {
        return ComposeReviewCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          fileController: context.read<FileController>(),
          ratingController: context.read<RatingController>(),
          loadingManager: context.read<LoadingManager>(),
          productId: productId,
        );
      },
      child: BlocListener<ComposeReviewCubit, ComposeReviewState>(
        listener: (BuildContext context, ComposeReviewState state) {
          if (state.isSuccess && context.mounted) {
            context.pop(true);
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: CommonAppBar(
              title: Text(S.of(context).writeReview),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingSection(),
                        SizedBox(height: 32),
                        SelectImageSection(),
                        SizedBox(height: 32),
                        ReviewTextBoxSection(),
                      ],
                    ),
                  ),
                ),
                BottomButton(
                  enableBorder: true,
                  title: S.of(context).sendWrittenReview,
                  onPress: () async {
                    final agreed = await ConfirmRouteData(
                            content: S.of(context).wouldYouLikeUploadAReview,
                            acceptTitle: S.of(context).ok)
                        .push<bool>(context);

                    if (agreed == null) {
                      return;
                    }
                    if (agreed == true && context.mounted) {
                      context.read<ComposeReviewCubit>().onSubmit();
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
