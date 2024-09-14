import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale/app_localizations.dart';
import '../../../shared/widgets/buttons/bottom_button.dart';
import '../../../shared/widgets/form_fields/form_phone_fields.dart';
import '../../../shared/widgets/textfields/button_textfield.dart';
import '../bloc/find_id_cubit.dart';
import '../bloc/find_id_state.dart';

class FindIdFormSection extends StatelessWidget {
  const FindIdFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 16),
          child: Column(
            children: [
              BlocBuilder<FindIdCubit, FindIdState>(buildWhen: (prev, curr) {
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
                    context.read<FindIdCubit>().onPhoneChanged(value);
                  },
                  errorText: renderPhoneError(
                    context,
                    state.phoneField.displayError,
                  ),
                  keyboardType: TextInputType.phone,
                  onSubmit: (value) {
                    context.read<FindIdCubit>().onSendOTPToDevice();
                  },
                );
              }),
              const SizedBox(height: 12),
              BlocBuilder<FindIdCubit, FindIdState>(buildWhen: (prev, curr) {
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
                    context.read<FindIdCubit>().onOTPChanged(value);
                  },
                  errorText:
                      renderOTPError(context, state.otpField.displayError),
                  keyboardType: TextInputType.phone,
                  onSubmit: (value) {
                    context.read<FindIdCubit>().onVerifyOTP();
                  },
                );
              }),
            ],
          ),
        )),
        BlocBuilder<FindIdCubit, FindIdState>(
          buildWhen: (prev, curr) {
            return prev.canFindId != curr.canFindId;
          },
          builder: (context, state) {
            return BottomButton(
              onPress: state.canFindId
                  ? () {
                      context.read<FindIdCubit>().onSubmit();
                    }
                  : null,
              title: S.of(context).findId,
            );
          },
        ),
      ],
    );
  }
}
