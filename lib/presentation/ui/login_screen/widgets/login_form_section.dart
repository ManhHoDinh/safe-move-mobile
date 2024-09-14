import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/textfields/common_textfield.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextField(
          hintText: S.of(context).username,
          onChanged: (value) {
            context.read<LoginCubit>().onUsernameChanged(value);
          },
        ),
        const SizedBox(height: 12),
        CommonTextField(
          hintText: S.of(context).password,
          obscure: true,
          onChanged: (value) {
            context.read<LoginCubit>().onPasswordChanged(value);
          },
        ),
        const SizedBox(height: 32),
        BlocBuilder<LoginCubit, LoginState>(buildWhen: (prev, curr) {
          return prev.canSubmit != curr.canSubmit;
        }, builder: (context, state) {
          return PrimaryButton.round(
            onPressed: state.canSubmit
                ? () {
                    context.read<LoginCubit>().onLoginWithUserInfo();
                  }
                : null,
            title: S.of(context).signIn,
          );
        }),
        const SizedBox(height: 8),
        const FindAccountSection(),
      ],
    );
  }
}

class FindAccountSection extends StatelessWidget {
  const FindAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _RoutingInkWell(
        title: S.of(context).register,
        onTap: () {
          // const RegisterRouteData().go(context);
          const TermAndCondAcceptRouteData(type: 0).go(context);
        },
      ),
      _RoutingInkWell(
        title: S.of(context).findId,
        onTap: () {
          const FindIdRouteData().go(context);
        },
      ),
      _RoutingInkWell(
        title: S.of(context).findPassword,
        onTap: () {
          const ResetPasswordRouteData().go(context);
        },
      )
    ];
    final List<Widget> renderItem = [];
    for (int i = 0; i < items.length; i++) {
      renderItem.add(items[i]);
      if (i < items.length - 1) {
        renderItem.add(Container(
          width: 1,
          height: 16,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          color: AppColors.gray.shade400,
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: renderItem,
    );
  }
}

class _RoutingInkWell extends StatelessWidget {
  const _RoutingInkWell({required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: Styles.s13()
              .withWeight(FontWeight.w500)
              .withLetterSpacing(-2.5 / 100)
              .withColor(AppColors.text.common),
        ),
      ),
    );
  }
}
