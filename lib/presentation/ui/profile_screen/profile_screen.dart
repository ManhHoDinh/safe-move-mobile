import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bases/user_cubit/user_cubit.dart';
import '../../gen/app_colors.dart';
import '../../gen/assets.gen.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/app_icon_button.dart';
import '../../shared/widgets/item_divider.dart';
import '../../gen/locale/app_localizations.dart';
import 'widgets/activity_section.dart';
import 'widgets/header_profile_seaction.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const ProfileScreen(),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return CustomTransitionBuilder.noTransition(
          context,
          animation,
          secondaryAnimation,
          child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewTextStyle = Styles.s12().withColor(AppColors.text.bodyText);
    return Scaffold(
      appBar: CommonAppBar(
        actions: [
          AppIconButton(
            icon: Assets.svgs.settingsIcon.svg(),
            onTap: () {
              const SettingRouteData().push(context);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UserCubit>().fetchUserData();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              const HeaderProfileSection(),
              const ItemDivider(
                padding: EdgeInsets.symmetric(vertical: 16),
                thickness: 4,
              ),
              const ActivitiesSection(),
              const SizedBox(height: 44),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).companyName,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    BusinessInfoRow(
                      title: S.of(context).ceoTitle,
                      content:
                          '${S.of(context).ceo}  |  ${S.of(context).emailTitle} ${S.of(context).emailValue}',
                    ),
                    BusinessInfoRow(
                      title: S.of(context).contactNumberTitle,
                      content: S.of(context).contactNumber,
                    ),
                    BusinessInfoRow(
                      title: S.of(context).businessRegistrationNumberTitle,
                      content: S.of(context).businessRegistrationNumber,
                    ),
                    BusinessInfoRow(
                      title: S.of(context).ecommerceRegistrationNumberTitle,
                      content: S.of(context).ecommerceRegistrationNumber,
                    ),
                    const SizedBox(height: 8.0),
                    BusinessInfoRow(
                      title: S.of(context).personalInfoProtectionOfficerTitle,
                      content: S.of(context).personalInfoProtectionOfficer,
                    ),
                    BusinessInfoRow(
                      title: S.of(context).officerEmailTitle,
                      content: S.of(context).officerEmail,
                    ),
                    const SizedBox(height: 8.0),
                    BusinessInfoRow(
                      title: S.of(context).addressTitle,
                      content: S.of(context).addressValue,
                    ),
                    const SizedBox(height: 16.0),
                    BusinessInfoRow(
                      title: S.of(context).copyrightTitle,
                      content: S.of(context).copyright,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BusinessInfoRow extends StatelessWidget {
  final String title;
  final String content;

  BusinessInfoRow({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13.0),
            ),
            TextSpan(
              text: ' $content',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
