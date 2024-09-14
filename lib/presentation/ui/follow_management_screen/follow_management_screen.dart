import 'package:flutter/material.dart';

import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/tab_bar.dart';
import 'blocs/follow_state.dart';
import 'widgets/follow_list.dart';

class FollowManagementScreen extends StatelessWidget {
  const FollowManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).followManage,
            style: Styles.s15()
                .withWeight(FontWeight.w600)
                .withLetterSpacing(-2.5 / 100),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AppTabBar(
              isScrollable: false,
              tabs: [
                PaddedTab(text: S.of(context).follow),
                PaddedTab(text: S.of(context).follower),
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                FollowList(
                  title: (context) => S.of(context).follow,
                  followType: FollowType.following,
                ),
                FollowList(
                  title: (context) => S.of(context).follower,
                  followType: FollowType.follower,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
