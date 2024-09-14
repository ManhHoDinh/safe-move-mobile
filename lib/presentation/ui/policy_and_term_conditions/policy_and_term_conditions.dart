import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/tab_bar.dart';
import 'widgets/privacy_policy_tab.dart';
import 'widgets/term_of_services_tab.dart';
import 'widgets/term_of_use_sm_mall.dart';

class PolicyAndTermConditionsScreen extends StatelessWidget {
  const PolicyAndTermConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).termAndPolicyConditions,
            style: Styles.s15()
                .withWeight(FontWeight.w600)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                PaddedTab(text: S.of(context).privacyPolicy),
                PaddedTab(text: S.of(context).termOfServiceTitle),
                PaddedTab(text: S.of(context).termOfUseSMMallTitle),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PrivacyPolicyTab(),
                  TermOfServicesTab(),
                  TermOfUseSMMall()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
