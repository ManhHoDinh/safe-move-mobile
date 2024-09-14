import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../application/services/main_page/main_page.dart';
import '../../gen/app_colors.dart';
import '../../router/router_config/router_config.dart';
import '../../shared/transitions/transitions.dart';
import '../../shared/widgets/app_bar/main_app_bar.dart';
import 'blocs/home_cubit.dart';
import 'blocs/home_state.dart';
import 'widgets/best_contents_section.dart';
import 'widgets/best_reviews_section.dart';
import 'widgets/celebs_section.dart';
import 'widgets/online_magazine_section.dart';
import 'widgets/sungong_museum_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const HomeScreen(),
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
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      lazy: false,
      create: (context) {
        return HomeCubit(
          mainPageController: context.read<MainPageController>(),
        );
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.blue.shade600,
            appBar: MainAppBar(
              onLogoTap: () {
                const HomeRouteData().go(context);
              },
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<HomeCubit>().reload();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CelebsSection(),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.blue.shade600,
                        border: Border.all(
                          color: AppColors.blue.shade600,
                          width: 0,
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: AppColors.gray.shade70,
                      child: const Column(
                        children: [
                          BestContentsSection(),
                          SizedBox(height: 48),
                          OnlineMagazineSection(),
                          SizedBox(height: 48),
                          BestReviewsSection(),
                          SizedBox(height: 48),
                          SungongMuseumSection(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
