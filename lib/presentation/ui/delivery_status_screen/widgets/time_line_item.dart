import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../application/services/sweettracker/response/response.dart';
import '../../../gen/app_colors.dart';
import 'time_line_information.dart';

class TimeLineItem extends StatelessWidget {
  const TimeLineItem({
    super.key,
    this.trackingDetailResponse,
    this.isFirst = false,
    this.isLast = false,
    this.isCompleted = false,
  });

  final TrackingDetailResponse? trackingDetailResponse;
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      beforeLineStyle: LineStyle(
        color: AppColors.blue.shade500,
        thickness: 2,
      ),
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 10,
        height: 10,
        indicator: Container(
          decoration: BoxDecoration(
            color: isFirst ? AppColors.blue.shade500 : AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.blue.shade500,
              width: 2,
            ),
          ),
        ),
      ),
      endChild: TimeLineInformation(
        where: trackingDetailResponse?.where ?? '',
        when: trackingDetailResponse?.timeString ?? '',
        status: trackingDetailResponse?.kind ?? '',
        isCompleted: isFirst && isCompleted,
      ),
    );
  }
}
