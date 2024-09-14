import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/user/user.dart';
import '../../../utilities/api_status/api_status.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/app_outlined_button.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../../shared/widgets/form_fields/form_email_field.dart';
import '../../shared/widgets/textfields/common_textfield.dart';
import '../../utilities/phone_format.dart';
import '../register_screen/bloc/register_state.dart';
import 'blocs/edit_account_information_cubit.dart';

class EditAccountInfoScreen extends StatelessWidget {
  const EditAccountInfoScreen({super.key});

  static TextStyle style = Styles.s15()
      .withHeight(24 / 15)
      .withLetterSpacing(-2.5 / 100)
      .withColor(AppColors.text.main);

  String? renderRegisterNameError(
      BuildContext context, RegisterNameFieldError? error) {
    switch (error) {
      case RegisterNameFieldError.empty:
        return S.of(context).empty;
      case null:
        return null;
    }
  }

  String? renderEmailError(BuildContext context, EmailFieldError? error) {
    switch (error) {
      case EmailFieldError.empty:
        return S.of(context).empty;
      case EmailFieldError.emailInvalid:
        return S.of(context).invalidEmailFormat;
      case null:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditAccountInformationCubit>(
      create: (BuildContext context) {
        return EditAccountInformationCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          loadingManager: context.read<LoadingManager>(),
          userController: context.read<UserController>(),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).accountInformationManagement,
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<EditAccountInformationCubit,
            EditAccountInformationState>(builder: (context, state) {
          if (state.apiStatus == ApiStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.apiStatus == ApiStatus.fail) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<EditAccountInformationCubit>().reload();
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
              },
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
                  child: Column(
                    children: [
                      if (state.accountType == AccountType.normal)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ItemEditAccount(
                            icon: Assets.svgs.idIcon.svg(),
                            information: CommonTextField.slim(
                              initialValue: state.username,
                              enable: false,
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      if (state.accountType == AccountType.normal)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ItemEditAccount(
                            icon: Assets.svgs.lockIcon.svg(),
                            information: Text(
                              '**************',
                              style: style,
                            ),
                            textBtn: S.of(context).changePassword,
                            onTap: () async {
                              final informationChanged =
                                  await const ChangePasswordRouteData()
                                      .push<bool>(context);
                              if (informationChanged == null) {
                                return;
                              }
                              if (informationChanged == true &&
                                  context.mounted) {
                                context
                                    .read<EditAccountInformationCubit>()
                                    .reload();
                              }
                            },
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      if (state.accountType == AccountType.naver)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ItemAccountInformation(
                            title: S.of(context).signInWithNaver,
                            icon: Assets.svgs.naverIcon
                                .svg(width: 24, height: 24),
                          ),
                        ),
                      if (state.accountType == AccountType.kakao)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ItemAccountInformation(
                            title: S.of(context).signInWithKakao,
                            icon: Assets.svgs.kakaoIcon
                                .svg(width: 24, height: 24),
                          ),
                        ),
                      if (state.accountType == AccountType.google)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ItemAccountInformation(
                            title: S.of(context).signInWithGoogle,
                            icon: Assets.svgs.googleIcon
                                .svg(width: 24, height: 24),
                          ),
                        ),
                      if (state.accountType == AccountType.apple)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _ItemAccountInformation(
                            title: S.of(context).signInWithApple,
                            icon: Assets.svgs.appleIcon
                                .svg(width: 24, height: 24),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemEditAccount(
                          icon: Assets.svgs.nameIcon.svg(),
                          information: CommonTextField.slim(
                            initialValue: state.nameField.value,
                            borderColor: AppColors.gray.shade700,
                            errorText: renderRegisterNameError(
                                context, state.nameField.displayError),
                            onChanged: (value) {
                              context
                                  .read<EditAccountInformationCubit>()
                                  .onChangeName(value);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ItemEditAccount(
                          icon: Assets.svgs.letterIcon.svg(),
                          information: CommonTextField.slim(
                            initialValue: state.emailField.value,
                            borderColor: AppColors.gray.shade700,
                            enable: state.accountType == AccountType.normal,
                            errorText: renderEmailError(
                                context, state.emailField.displayError),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              context
                                  .read<EditAccountInformationCubit>()
                                  .onChangeEmail(value);
                            },
                          ),
                        ),
                      ),
                      _ItemEditAccount(
                        icon: Assets.svgs.phoneIcon.svg(
                            width: 20,
                            height: 20,
                            color: AppColors.text.common),
                        information: Text(
                          state.phoneNumber.isEmpty
                              ? ''
                              : phoneFormat(state.phoneNumber),
                          style: style,
                        ),
                        textBtn: S.of(context).editCellPhoneNumber,
                        onTap: () async {
                          final informationChanged =
                              await const ChangePhoneNumberRouteData()
                                  .push<bool>(context);
                          if (informationChanged == null) {
                            return;
                          }
                          if (informationChanged == true && context.mounted) {
                            context
                                .read<EditAccountInformationCubit>()
                                .reload();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                title: S.of(context).save,
                enableBorder: true,
                onPress: state.canSubmit
                    ? () {
                        context.read<EditAccountInformationCubit>().submit();
                      }
                    : null,
              )
            ],
          );
        }),
      ),
    );
  }
}

class _ItemEditAccount extends StatelessWidget {
  const _ItemEditAccount(
      {required this.icon,
      required this.information,
      this.textBtn,
      this.onTap});

  final Widget icon;
  final Widget information;
  final String? textBtn;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: information,
        ),
        if (textBtn != null && onTap != null)
          AppOutlinedButton.square(
            onPressed: onTap,
            title: textBtn ?? '',
            wrapContent: true,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            borderRadius: BorderRadius.circular(8),
            textStyle: Styles.s13()
                .withLetterSpacing(-2.5 / 100)
                .withWeight(FontWeight.w500)
                .withColor(AppColors.blue.shade500),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}

class _ItemAccountInformation extends StatelessWidget {
  const _ItemAccountInformation({required this.title, required this.icon});

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
