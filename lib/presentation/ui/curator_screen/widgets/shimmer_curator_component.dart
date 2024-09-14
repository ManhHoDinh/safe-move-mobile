import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/widgets/posts/post_info.dart';
import '../../../shared/widgets/tab_bar.dart';
import '../../../utilities/date_format.dart';

class ShimmerCuratorContent extends StatelessWidget {
  const ShimmerCuratorContent({
    super.key,
    this.totalTabs = 10,
  });

  final int totalTabs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: totalTabs,
      child: IgnorePointer(
        child: Column(
          children: [
            AppShimmer(
              child: AppTabBar(
                backgroundColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,
                tabs: List.generate(
                  totalTabs,
                  (index) {
                    return Tab(
                      height: 40,
                      child: Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                  totalTabs,
                  (index) => const SingleCuratorShimmerTab(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCuratorShimmerTab extends StatelessWidget {
  const SingleCuratorShimmerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppShimmer(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 18,
            ).copyWith(top: 10),
          ),
        ),
        AppShimmer(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
          ),
        ),
        const Expanded(
          child: CuratorShimmerContent(),
        ),
      ],
    );
  }
}

class CuratorShimmerContent extends StatelessWidget {
  const CuratorShimmerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return PostInfo(
            title: '이혼 사실을 숨기는데 급급한 싱글맘이었어요',
            role: '홍준표 CEO',
            loading: true,
            trailing: formatDate(DateTime(2023, 2, 20)),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemCount: 100,
      ),
    );
  }
}
