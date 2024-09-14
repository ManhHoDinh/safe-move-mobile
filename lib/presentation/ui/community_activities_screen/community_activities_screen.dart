import 'package:flutter/material.dart';

import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/tab_bar.dart';
import 'blocs/associated_post_cubit.dart';
import 'widgets/associated_post_community_content.dart';

class CommunityActivitiesScreen extends StatelessWidget {
  const CommunityActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).communityActivities,
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
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              tabs: [
                PaddedTab(text: S.of(context).whatYouWrote),
                PaddedTab(text: S.of(context).postWithComment),
                PaddedTab(text: S.of(context).likedPost),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: TabBarView(
                children: [
                  AssociatedPostCommunityContent(
                    type: AssociatedPostType.communityWritten,
                  ),
                  AssociatedPostCommunityContent(
                    type: AssociatedPostType.communityCommented,
                  ),
                  AssociatedPostCommunityContent(
                    type: AssociatedPostType.communityLiked,
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
