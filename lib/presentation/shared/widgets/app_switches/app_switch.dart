import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.switchValue,
    required this.onChanged,
  });

  final bool switchValue;
  final void Function(bool value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(useMaterial3: false)
          .copyWith(platform: TargetPlatform.iOS),
      child: Switch.adaptive(
        value: switchValue,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        trackOutlineWidth: MaterialStateProperty.resolveWith((states) => 0),
        trackOutlineColor:
            MaterialStateProperty.resolveWith((states) => Colors.transparent),
        thumbColor: MaterialStateColor.resolveWith((states) => AppColors.white),
        activeTrackColor: AppColors.blue.shade500,
        inactiveTrackColor: AppColors.gray.shade400,
        onChanged: onChanged,
      ),
    );
  }
}
