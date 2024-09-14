import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/user/user.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../bases/auth_cubit/auth_cubit.dart';
import '../../bases/user_cubit/user_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../utilities/phone_format.dart';
import 'blocs/account_information_management_cubit.dart';

class AccountInfoManagementScreen extends StatelessWidget {
  const AccountInfoManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          S.of(context).accountInformationManagement,
          style: Styles.s15()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.main),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () async {
              await const EditAccountInformationRouteData().push(context);
              if (!context.mounted) {
                return;
              }
              context.read<UserCubit>().fetchUserData();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).edit,
                style: Styles.s13()
                    .withWeight(FontWeight.w500)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.blue.shade500),
              ),
            ),
          )
        ],
      ),
      body: BlocProvider<AccountInformationManagementCubit>(
        create: (BuildContext context) {
          return AccountInformationManagementCubit(
            userController: context.read<UserController>(),
            handlerManager: context.read<FailureHandlerManager>(),
            loadingManager: context.read<LoadingManager>(),
            authCubit: context.read<AuthCubit>(),
          );
        },
        child: BlocListener<AccountInformationManagementCubit,
            AccountInformationManagementState>(
          listener:
              (BuildContext context, AccountInformationManagementState state) {
            if (state.accountDeactivated) {
              const HomeRouteData().go(context);
            }
          },
          child: BlocBuilder<AccountInformationManagementCubit,
              AccountInformationManagementState>(builder: (context, state) {
            if (state.apiStatus == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.apiStatus == ApiStatus.fail) {
              return LayoutBuilder(builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<AccountInformationManagementCubit>().reload();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      height: constraints.maxHeight,
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(S.of(context).someThingWentWrong),
                      ),
                    ),
                  ),
                );
              });
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<AccountInformationManagementCubit>().reload();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 8,
                    ),
                    if (state.userDTO?.accountType == AccountType.normal)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: state.userDTO?.username ?? '',
                          icon: Assets.svgs.idIcon.svg(),
                        ),
                      ),
                    if (state.userDTO?.accountType == AccountType.naver)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: S.of(context).signInWithNaver,
                          icon:
                              Assets.svgs.naverIcon.svg(width: 24, height: 24),
                        ),
                      ),
                    if (state.userDTO?.accountType == AccountType.kakao)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: S.of(context).signInWithKakao,
                          icon:
                              Assets.svgs.kakaoIcon.svg(width: 24, height: 24),
                        ),
                      ),
                    if (state.userDTO?.accountType == AccountType.google)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: S.of(context).signInWithGoogle,
                          icon:
                              Assets.svgs.googleIcon.svg(width: 24, height: 24),
                        ),
                      ),
                    if (state.userDTO?.accountType == AccountType.apple)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: S.of(context).signInWithApple,
                          icon:
                              Assets.svgs.appleIcon.svg(width: 24, height: 24),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _ItemAccountInformation(
                        title: state.userDTO?.name ?? '',
                        icon: Assets.svgs.nameIcon.svg(),
                      ),
                    ),
                    if (state.userDTO?.email?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: state.userDTO?.email ?? '',
                          icon: Assets.svgs.letterIcon.svg(),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    if (state.userDTO?.phoneNumber?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemAccountInformation(
                          title: state.userDTO?.phoneNumber == null
                              ? ''
                              : phoneFormat(state.userDTO!.phoneNumber!),
                          icon: Assets.svgs.phoneIcon.svg(
                              width: 20,
                              height: 20,
                              color: AppColors.text.common),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () async {
                          final agreed = await ConfirmRouteData(
                                  content: S
                                      .of(context)
                                      .areYouSureYouWantToUnregister)
                              .push<bool>(context);

                          if (agreed == null) {
                            return;
                          }
                          if (agreed == true && context.mounted) {
                            context
                                .read<AccountInformationManagementCubit>()
                                .deactivateAccount();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 15)
                              .copyWith(left: 18),
                          child: Text(
                            S.of(context).withdrawal,
                            style: Styles.s15()
                                .withWeight(FontWeight.w500)
                                .withLetterSpacing(-2.5 / 100)
                                .withColor(AppColors.text.bodyText),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _ItemAccountInformation extends StatelessWidget {
  const _ItemAccountInformation({required this.title, required this.icon});

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: Styles.s15()
                .withHeight(24 / 15)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          )
        ],
      ),
    );
  }
}
