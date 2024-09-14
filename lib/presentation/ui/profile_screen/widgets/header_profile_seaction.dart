import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utilities/api_status/api_status.dart';
import '../../../bases/auth_cubit/auth_cubit.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/profile_info_section.dart';
import 'business_card_action.dart';

class HeaderProfileSection extends StatelessWidget {
  const HeaderProfileSection(
      {super.key, this.duration = const Duration(milliseconds: 300)});

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      child: AnimatedSwitcher(
        duration: duration,
        child: Builder(builder: (context) {
          final authState = context.watch<AuthCubit>().state;
          final userState = context.watch<UserCubit>().state;
          if (authState is AuthStatusLoggedOutState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    const ProfileLoginRouteData().go(context);
                  },
                  child: Row(children: [
                    Assets.svgs.appIcon.svg(),
                    const SizedBox(width: 24),
                    Text(
                      S.of(context).loginAndSignUp,
                      style: Styles.s18()
                          .withWeight(FontWeight.w600)
                          .withHeight(1)
                          .withLetterSpacing(-2.5 / 100)
                          .withColor(AppColors.text.main),
                    ),
                    const SizedBox(width: 16),
                    Assets.svgs.chevronRight16.svg(
                      width: 24,
                      height: 24,
                      color: AppColors.text.common,
                    ),
                  ]),
                ),
              ),
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: userState.apiStatus != ApiStatus.success
                      ? const AppShimmer(
                          child: ProfileInfoSection(
                            name: '',
                            description: '',
                            loading: true,
                          ),
                        )
                      : ProfileInfoSection(
                          imageUrl: userState.detail?.avatarUrl,
                          name: userState.detail?.name ?? '',
                          description: userState.detail?.bio ?? '',
                          point: userState.detail?.point,
                        ),
                ),
                const SizedBox(height: 24),
                BusinessCardAction(
                  userId: userState.detail?.id ?? 1,
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
