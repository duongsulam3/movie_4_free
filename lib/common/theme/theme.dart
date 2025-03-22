import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/theme/app_colors.dart';

class AppTheme {
  static final blackTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    primaryColorLight: AppColors.lightColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(color: Colors.transparent),
      dividerHeight: 0,
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
