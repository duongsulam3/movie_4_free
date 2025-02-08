import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/theme/app_colors.dart';

class AppTheme {
  static final blackTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
  );
}
