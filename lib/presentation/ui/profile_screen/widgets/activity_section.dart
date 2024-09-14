import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/services/user/dto/src/user_dto.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/router_config.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/gap_items.dart';
import '../../../shared/widgets/item_divider.dart';
import '../../../utilities/request_login.dart';
import '../../address_managent_screen/address_management_screen.dart';

class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({super.key});

  static TextStyle styleTitle = Styles.s15()
      .withWeight(FontWeight.w500)
      .withLetterSpacing(-2.5 / 100)
      .withColor(AppColors.text.main);

  @override
  Widget build(BuildContext context) {
    final currentRole = context.read<UserCubit>().state.detail?.role;
    final isAdmin = currentRole != null && currentRole != Role.member;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GapItems(items: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: Text(
              S.of(context).activity,
              style: styleTitle,
            ),
          ),
          _ItemActivity(
            title: S.of(context).followManagement,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const FollowManagementRouteData().go(context);
              }
            },
          ),
          _ItemActivity(
            title: S.of(context).favoritesBulletinBoard,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const FavoritesBulletinBoardRouteData().go(context);
              }
            },
          ),
          _ItemActivity(
            title: S.of(context).curationActivities,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const CuratorActivitiesRouteData().go(context);
              }
            },
          ),
          _ItemActivity(
            title: S.of(context).communityActivities,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const CommunityActivitiesRouteData().go(context);
              }
            },
          ),
          if (isAdmin)
            _ItemActivity(
              title: S.of(context).reportScreen,
              onTap: () async {
                final isLoggedIn = await requestLoginAction(context);
                if (!context.mounted) {
                  return;
                }
                if (isLoggedIn) {
                  const ReportedRouteData().go(context);
                }
              },
            ),
        ], gap: 0),
        const ItemDivider(
          padding: EdgeInsets.symmetric(vertical: 16),
          thickness: 4,
        ),
        GapItems(items: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: Text(
              S.of(context).store,
              style: styleTitle,
            ),
          ),
          _ItemActivity(
            title: S.of(context).myDeliveryInformation,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const AddressRouteData(addressType: AddressType.management)
                    .push(context);
              }
            },
          ),
          _ItemActivity(
            title: S.of(context).checkOrderDeliveryDetails,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const CheckOrderDeliveryDetailRouteData().go(context);
              }
            },
          ),
          _ItemActivity(
            title: S.of(context).inquiryDetails,
            onTap: () async {
              final isLoggedIn = await requestLoginAction(context);
              if (!context.mounted) {
                return;
              }
              if (isLoggedIn) {
                const InquiryHistoryRouteData().go(context);
              }
            },
          ),
        ], gap: 0),
        const ItemDivider(
          padding: EdgeInsets.symmetric(vertical: 16),
          thickness: 4,
        ),
        GapItems(
          items: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              child: Text(
                S.of(context).etc,
                style: styleTitle,
              ),
            ),
            _ItemActivity(
              title: S.of(context).recommenderStatus,
              onTap: () async {
                final isLoggedIn = await requestLoginAction(context);
                if (!context.mounted) {
                  return;
                }
                if (isLoggedIn) {
                  const ReferralRouteData().go(context);
                }
              },
            ),
          ],
          gap: 0,
        )
      ],
    );
  }
}

class _ItemActivity extends StatelessWidget {
  const _ItemActivity({required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Row(
            children: [
              Text(
                title,
                style: Styles.s15()
                    .withHeight(24 / 15)
                    .withLetterSpacing(-2.5 / 100)
                    .withColor(AppColors.text.main),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
