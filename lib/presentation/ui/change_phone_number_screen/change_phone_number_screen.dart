import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/auth/auth.dart';
import '../../../application/services/user/user.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/handlers/failure_handler/failure_handler_manager.dart';
import '../../shared/handlers/loading_handler/loading_manager.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/buttons/bottom_button.dart';
import '../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../shared/widgets/textfields/button_textfield.dart';
import 'blocs/change_phone_number_cubit.dart';
import 'blocs/change_phone_number_state.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({super.key});

  String renderDialogContent(BuildContext context, DialogContent error) {
    switch (error) {
      case DialogContent.phoneNumberExisted:
        return S.of(context).phoneNumberExisted;
      case DialogContent.verifyOTPSuccess:
        return S.of(context).verifyOTPSuccess;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePhoneNumberCubit>(
      create: (BuildContext context) {
        return ChangePhoneNumberCubit(
          userController: context.read<UserController>(),
          authController: context.read<AuthController>(),
          loadingManager: context.read<LoadingManager>(),
          failureHandlerManager: context.read<FailureHandlerManager>(),
          initialState: const ChangePhoneNumberState(),
        );
      },
      child: BlocListener<ChangePhoneNumberCubit, ChangePhoneNumberState>(
        listenWhen: (prev, curr) {
          return prev.changePhoneNumberFlowCompleted !=
                  curr.changePhoneNumberFlowCompleted ||
              prev.dialogContent != curr.dialogContent;
        },
        listener: (BuildContext context, ChangePhoneNumberState state) async {
          if (state.changePhoneNumberFlowCompleted && context.mounted) {
            context.pop(true);
          }

          if (state.dialogContent != null) {
            final String content =
                renderDialogContent(context, state.dialogContent!);
            context.read<ChangePhoneNumberCubit>().dialogHandled();

            AlertRouteData(content: content).push(context);
          }
        },
        child: Scaffold(
          appBar: CommonAppBar(
            title: Text(
              S.of(context).changePhoneNumber,
              style: Styles.s15()
                  .withWeight(FontWeight.w500)
                  .withLetterSpacing(-2.5 / 100),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 24, bottom: 16),
                child: Column(
                  children: [
                    BlocBuilder<ChangePhoneNumberCubit, ChangePhoneNumberState>(
                        buildWhen: (prev, curr) {
                      return prev.canSentOTP != curr.canSentOTP ||
                          prev.phoneField.value != curr.phoneField.value ||
                          prev.expiredIn != curr.expiredIn;
                    }, builder: (context, state) {
                      return ButtonTextField(
                        enableTextField: !state.canEnterOTP,
                        enableButton: state.canSentOTP,
                        buttonTitle: state.expiredIn != 0
                            ? state.expiredIn.toString()
                            : S.of(context).sendAuthentication,
                        hintText: S.of(context).placeHolderPhone,
                        onChanged: (value) {
                          context
                              .read<ChangePhoneNumberCubit>()
                              .onPhoneChanged(value);
                        },
                        errorText: renderPhoneError(
                          context,
                          state.phoneField.displayError,
                        ),
                        keyboardType: TextInputType.phone,
                        onSubmit: (value) {
                          context
                              .read<ChangePhoneNumberCubit>()
                              .onSendOTPToDevice();
                        },
                      );
                    }),
                    const SizedBox(height: 12),
                    BlocBuilder<ChangePhoneNumberCubit, ChangePhoneNumberState>(
                        buildWhen: (prev, curr) {
                      return prev.canVerifyOTP != curr.canVerifyOTP ||
                          prev.canEnterOTP != curr.canEnterOTP ||
                          prev.expiredIn != curr.expiredIn;
                    }, builder: (context, state) {
                      return ButtonTextField(
                        enableButton: state.canVerifyOTP,
                        enableTextField: state.canEnterOTP,
                        buttonTitle: S.of(context).verify,
                        hintText: S.of(context).otpNumber,
                        onChanged: (value) {
                          context
                              .read<ChangePhoneNumberCubit>()
                              .onOTPChanged(value);
                        },
                        errorText: renderOTPError(
                            context, state.otpField.displayError),
                        keyboardType: TextInputType.phone,
                        onSubmit: (value) {
                          context.read<ChangePhoneNumberCubit>().onVerifyOTP();
                        },
                      );
                    }),
                  ],
                ),
              )),
              BlocBuilder<ChangePhoneNumberCubit, ChangePhoneNumberState>(
                  buildWhen: (prev, curr) {
                return prev.canChangePassword != curr.canChangePassword;
              }, builder: (context, state) {
                return BottomButton(
                  onPress: state.canChangePassword
                      ? () {
                          context.read<ChangePhoneNumberCubit>().onSubmit();
                        }
                      : null,
                  title: S.of(context).change,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
