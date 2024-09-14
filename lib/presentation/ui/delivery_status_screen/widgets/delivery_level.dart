import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../shared/theme/src/app_style.dart';
import '../../../shared/widgets/gap_items.dart';

class DeliveryLevel extends StatelessWidget {
  const DeliveryLevel({super.key, required this.currentLevel});

  final int currentLevel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      scrollDirection: Axis.horizontal,
      child: GapItems(
        crossAxisAlignmentRow: CrossAxisAlignment.center,
        axis: Axis.horizontal,
        separate: Container(
          width: 30,
          margin: const EdgeInsets.only(bottom: 20),
          height: 1,
          color: AppColors.gray.shade400,
        ),
        items: [
          DeliveryItem(
            icon: Assets.svgs.productAcceptance.svg(),
            isCurrentLevel: currentLevel == 2,
            title: S.of(context).productAcceptance,
          ),
          DeliveryItem(
            icon: Assets.svgs.productInTransit.svg(),
            isCurrentLevel: currentLevel == 3,
            title: S.of(context).productInTransit,
          ),
          DeliveryItem(
            icon: Assets.svgs.deliveryArrived.svg(),
            isCurrentLevel: currentLevel == 4,
            title: S.of(context).deliveryArrived,
          ),
          DeliveryItem(
            icon: Assets.svgs.startDelivery.svg(),
            isCurrentLevel: currentLevel == 5,
            title: S.of(context).startDelivery,
          ),
          DeliveryItem(
            icon: Assets.svgs.deliveryCompleted.svg(),
            isCurrentLevel: currentLevel == 6,
            title: S.of(context).deliveryComplete,
          ),
        ],
      ),
    );
  }
}

class DeliveryItem extends StatelessWidget {
  const DeliveryItem(
      {super.key,
      required this.icon,
      required this.isCurrentLevel,
      required this.title});

  final Widget icon;
  final bool isCurrentLevel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCurrentLevel
                  ? AppColors.blue.shade500
                  : AppColors.gray.shade300,
            ),
            child: icon),
        const SizedBox(height: 4),
        Text(title,
            style: Styles.s13().withColor(isCurrentLevel
                ? AppColors.blue.shade500
                : AppColors.gray.shade500)),
      ],
    );
  }
}
