import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../utilities/logging/logging.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../bloc/login_cubit.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final divider = Expanded(
      child: Divider(
        color: AppColors.gray.shade300,
        height: 1,
        thickness: 1,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            divider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.5),
              child: Text(S.of(context).easyLoginSNS,
                  style: Styles.s13()
                      .withColor(AppColors.text.bodyText)
                      .withLetterSpacing(-2.5 / 100)),
            ),
            divider,
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialLogin(
                icon: Assets.svgs.naverIcon.svg(),
                onTap: () async {
                  await FlutterNaverLogin.logIn();
                  final NaverAccessToken res =
                      await FlutterNaverLogin.currentAccessToken;
                  if (!context.mounted) {
                    return;
                  }
                  logging.e(res.accessToken);

                  context.read<LoginCubit>().onLoginWithNaver(res.accessToken);
                }),
            const SizedBox(width: 16),
            _SocialLogin(
                icon: Assets.svgs.kakaoIcon.svg(),
                onTap: () async {
                  try {
                    final OAuthToken token =
                        await UserApi.instance.loginWithKakaoAccount();
                    if (!context.mounted) {
                      return;
                    }
                    logging.e(token.accessToken);

                    context
                        .read<LoginCubit>()
                        .onLoginWithKakao(token.accessToken);
                  } catch (e) {
                    logging.i('Login fails. $e');
                  }
                }),
            const SizedBox(width: 16),
            _SocialLogin(
              icon: Assets.svgs.googleIcon.svg(),
              onTap: () async {
                try {
                  final GoogleSignInAccount? googleUser =
                      await GoogleSignIn().signIn();

                  final GoogleSignInAuthentication? googleAuth =
                      await googleUser?.authentication;

                  final credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth?.accessToken,
                    idToken: googleAuth?.idToken,
                  );
                  final auth2 = await FirebaseAuth.instance
                      .signInWithCredential(credential);

                  final idToken = await auth2.user?.getIdToken();

                  if (!context.mounted || idToken == null) {
                    return;
                  }
                  context.read<LoginCubit>().onLoginWithGoogle(idToken);
                } catch (err) {
                  logging.e(err);
                }
              },
            ),
            if (Platform.isIOS) const SizedBox(width: 16),
            if (Platform.isIOS)
              _SocialLogin(
                  icon: Assets.svgs.appleIcon.svg(),
                  onTap: () async {
                    try {
                      final AuthorizationCredentialAppleID credential =
                          await SignInWithApple.getAppleIDCredential(
                        scopes: [
                          AppleIDAuthorizationScopes.email,
                          AppleIDAuthorizationScopes.fullName,
                        ],
                      );
                      if (!context.mounted &&
                          credential.identityToken == null) {
                        return;
                      }
                      context
                          .read<LoginCubit>()
                          .onLoginWithApple(credential.identityToken!);
                    } catch (e) {
                      logging.e(e);
                    }
                  }),
            const SizedBox(width: 16),
          ],
        ),
      ],
    );
  }
}

class _SocialLogin extends StatelessWidget {
  const _SocialLogin({required this.icon, required this.onTap});

  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FittedBox(
          child: SizedBox(
            width: 48,
            height: 48,
            child: icon,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
