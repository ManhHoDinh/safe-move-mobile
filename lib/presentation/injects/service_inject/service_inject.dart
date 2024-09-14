import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../../../di/di.dart';
import '../../bases/childless_assertion/childless_assertion.dart';

class ServiceInject extends SingleChildStatelessWidget with ChildlessAssertion {
  const ServiceInject({super.key});

  @override
  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    final AppDIData appDIData = context.read<AppDIData>();
    return Nested(
      children: [
        RepositoryProvider.value(value: appDIData.authController),
        RepositoryProvider.value(value: appDIData.userController),
        RepositoryProvider.value(value: appDIData.categoryController),
        RepositoryProvider.value(value: appDIData.mainPageController),
        RepositoryProvider.value(value: appDIData.postCommentController),
        RepositoryProvider.value(value: appDIData.postCommunityController),
        RepositoryProvider.value(value: appDIData.postCuratorController),
        RepositoryProvider.value(value: appDIData.postSgmNewsController),
        RepositoryProvider.value(value: appDIData.productController),
        RepositoryProvider.value(value: appDIData.qaController),
        RepositoryProvider.value(value: appDIData.ratingController),
        RepositoryProvider.value(value: appDIData.socialMediaController),
        RepositoryProvider.value(value: appDIData.userAddressController),
        RepositoryProvider.value(value: appDIData.userCartController),
        RepositoryProvider.value(value: appDIData.profileUrlController),
        RepositoryProvider.value(value: appDIData.userFollowController),
        RepositoryProvider.value(
            value: appDIData.userFavoriteCategoryController),
        RepositoryProvider.value(value: appDIData.userOrderController),
        RepositoryProvider.value(value: appDIData.userOrderSessionController),
        RepositoryProvider.value(value: appDIData.userPostReactionController),
        RepositoryProvider.value(value: appDIData.fileController),
        RepositoryProvider.value(value: appDIData.adminPostCuratorController),
        RepositoryProvider.value(value: appDIData.adminPostSgmNewsController),
        RepositoryProvider.value(value: appDIData.youtubeClientService),
        RepositoryProvider.value(value: appDIData.youtubeVideoController),
        RepositoryProvider.value(value: appDIData.localeService),
        RepositoryProvider.value(value: appDIData.statsController),
        RepositoryProvider.value(value: appDIData.sweetTrackerController),
        RepositoryProvider.value(value: appDIData.termAndCondController),
      ],
      child: child,
    );
  }
}
