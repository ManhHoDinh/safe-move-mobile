import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/tab_bar.dart';
import '../community_activities_screen/blocs/associated_post_cubit.dart';
import '../community_activities_screen/widgets/associated_post_curator_content.dart';

class CuratorActivitiesScreen extends StatelessWidget {
  const CuratorActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).curationActivities,
            style: Styles.s15()
                .withWeight(FontWeight.w500)
                .withLetterSpacing(-2.5 / 100)
                .withColor(AppColors.text.main),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTabBar(
              isScrollable: false,
              tabs: [
                PaddedTab(text: S.of(context).postWithComment),
                PaddedTab(text: S.of(context).likedPost),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: TabBarView(
                children: [
                  AssociatedPostCuratorContent(
                    type: AssociatedPostType.curatorCommented,
                  ),
                  AssociatedPostCuratorContent(
                    type: AssociatedPostType.curatorLiked,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
