import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/file/file.dart';
import '../../../application/services/user/user.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/user_cubit/user_cubit.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import 'blocs/profile_info_cubit.dart';
import 'blocs/profile_info_state.dart';
import 'blocs/social_media_content_cubit.dart';
import 'blocs/social_media_list_cubit.dart';
import 'widgets/basic_info_section.dart';
import 'widgets/basice_info_shimmer.dart';
import 'widgets/social_media_content_list_section.dart';
import 'widgets/social_media_list_section.dart';

class BusinessCardEditScreen extends StatelessWidget {
  const BusinessCardEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          S.of(context).businessCardEdit,
          style: Styles.s15()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100),
        ),
        centerTitle: true,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileInfoCubit>(
            lazy: false,
            create: (context) => ProfileInfoCubit(
              failureHandlerManager: context.read<FailureHandlerManager>(),
              loadingManager: context.read<LoadingManager>(),
              userController: context.read<UserController>(),
              fileController: context.read<FileController>(),
            ),
          ),
          BlocProvider<SocialMediaListCubit>(
            lazy: false,
            create: (context) => SocialMediaListCubit(
              failureHandlerManager: context.read<FailureHandlerManager>(),
              userController: context.read<UserController>(),
            ),
          ),
          BlocProvider<SocialMediaContentCubit>(
            lazy: false,
            create: (context) => SocialMediaContentCubit(
              failureHandlerManager: context.read<FailureHandlerManager>(),
              userController: context.read<UserController>(),
              fileController: context.read<FileController>(),
            ),
          ),
        ],
        child: Builder(builder: (context) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 8, 18, 32),
                    child: Column(
                      children: [
                        BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
                            buildWhen: (previous, current) {
                          return previous.apiStatus != current.apiStatus;
                        }, builder: (context, state) {
                          return state.apiStatus != ApiStatus.success &&
                                  state.apiStatus != ApiStatus.fail
                              ? const BasicInfoShimmer()
                              : BasicInfoSection(
                                  bio: state.bio,
                                  email: state.email,
                                  name: state.name,
                                  phoneNumber: state.phoneNumber,
                                  imageUrl: state.imageUrl,
                                );
                        }),
                        const SocialMediaListSection(),
                        const SizedBox(height: 32),
                        const SocialMediaContentList(),
                      ],
                    ),
                  ),
                ),
              ),
              const _BottomButtonListen()
            ],
          );
        }),
      ),
    );
  }
}

class _BottomButtonListen extends StatelessWidget {
  const _BottomButtonListen();

  @override
  Widget build(BuildContext context) {
    return BottomButton(
      title: S.of(context).save,
      onPress: () async {
        final futureLoading = Future.wait([
          context.read<ProfileInfoCubit>().updateProfileInfo(),
          context.read<SocialMediaListCubit>().updateSocialMedia(),
          context.read<SocialMediaContentCubit>().updateSocialMediaContent(),
        ]);

        final results = await context
            .read<LoadingManager>()
            .startLoading(future: futureLoading);
        bool checkedReturn = false;
        for (final result in results) {
          if (result != null && result.isLeft && context.mounted) {
            context.read<FailureHandlerManager>().handle(result.left);
            return;
          }
          if (result == null) {
            checkedReturn = true;
          }
          if (!context.mounted) {
            return;
          }
          if (result?.right is UserDTO) {
            context.read<ProfileInfoCubit>().reload();
            context.read<UserCubit>().fetchUserData();
          } else if (result?.isRight is List<SocialMediaResponse>) {
            context.read<SocialMediaListCubit>().reload();
          } else if (result?.isRight is List<ProfileUrlResponse>) {
            context.read<SocialMediaContentCubit>().reload();
          }
        }
        if (!context.mounted || checkedReturn) {
          return;
        }
        context.pop();
      },
      enableBorder: true,
    );
  }
}
