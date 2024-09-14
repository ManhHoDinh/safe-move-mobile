import 'package:flutter/material.dart';

import '../../../gen/app_colors.dart';
import '../../../gen/fonts.gen.dart';

class AppTheme {
  AppTheme._();

  static const ThemeMode defaultTheme = ThemeMode.light;

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: FontFamily.pretendard,
      scaffoldBackgroundColor: AppColors.gray.shade70,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue.shade500),
    );
  }
}
