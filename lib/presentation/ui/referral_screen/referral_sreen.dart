import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/api_status/api_status.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/base_infinite_loading/app_shimmer.dart';
import '../../shared/theme/theme.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/item_divider.dart';
import '../../utilities/phone_format.dart';
import 'blocs/referral_cubit.dart';
import 'widgets/current_referrer_item.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReferralCubit>(
      create: (BuildContext context) {
        return ReferralCubit(
          failureHandlerManager: context.read(),
          userController: context.read(),
        );
      },
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).referrerStatus,
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ReferralCubit, ReferralState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 17),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).currentReferrer,
                        style: Styles.s15()
                            .withHeight(24 / 15)
                            .withLetterSpacing(-2.5 / 100)
                            .withColor(AppColors.text.common),
                      ),
                      const SizedBox(height: 10),
                      if (state.apiStatus == ApiStatus.loading)
                        AppShimmer(
                          child: Container(
                            height: 28,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.gray.shade500,
                            ),
                          ),
                        )
                      else
                        Text(
                          S.of(context).numberPeople(
                                state.data.length,
                              ),
                          style: Styles.s20()
                              .withWeight(FontWeight.w600)
                              .withLetterSpacing(-0.5 / 100)
                              .withColor(AppColors.black),
                        ),
                    ],
                  ),
                ),
                const ItemDivider(
                    padding: EdgeInsets.only(top: 24, bottom: 20)),
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 17),
                  child: Text(
                    S.of(context).currentReferrerList,
                    style: Styles.s15()
                        .withHeight(24 / 15)
                        .withLetterSpacing(-2.5 / 100)
                        .withColor(AppColors.text.common),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<ReferralCubit>().reload();
                    },
                    child: ListView.separated(
                      physics: state.apiStatus == ApiStatus.loading
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      padding: const EdgeInsets.only(left: 19, right: 17),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                      itemCount: state.apiStatus == ApiStatus.loading
                          ? 100
                          : state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (state.apiStatus == ApiStatus.loading) {
                          return AppShimmer(
                            child: CurrentReferrerItem(
                              name: '작성자',
                              phone: phoneFormat('01012345678'),
                              loading: true,
                            ),
                          );
                        }
                        final data = state.data[index];
                        return CurrentReferrerItem(
                          name: data.name ?? '',
                          phone: (data.phoneNumber?.isNotEmpty ?? false)
                              ? phoneFormat('01012345678')
                              : '',
                          imageUrl: data.avatarUrl,
                          onPressed: () {
                            ProfileDetailsRouteData(userId: data.id ?? 0)
                                .push(context);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
