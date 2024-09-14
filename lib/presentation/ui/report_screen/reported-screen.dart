import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../presentation/ui/report_screen/tabs/report_user.dart';
import '../../gen/app_colors.dart';
import '../../gen/locale/app_localizations.dart';
import '../../shared/theme/src/app_style.dart';
import '../../shared/widgets/app_bar/common_app_bar.dart';
import '../../shared/widgets/tab_bar.dart';
import 'tabs/reported_comment_tab.dart';
import 'tabs/reported_post_tab.dart';

class ReportedScreen extends StatelessWidget {
  const ReportedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CommonAppBar(
          title: Text(
            S.of(context).reportScreen,
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
                PaddedTab(text: S.of(context).reportedPost),
                PaddedTab(text: S.of(context).reportedComment),
                PaddedTab(text: S.of(context).reportedUser),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ReportedPostTab(),
                  ReportedCommentTab(),
                  ReportedUserTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
