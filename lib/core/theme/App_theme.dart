import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/App_Colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      type: .fixed,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        color: AppColors.whiteColor,
        fontWeight: .w700,
        fontFamily: 'Janna',
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColors.whiteColor,
        fontWeight: .w700,
        fontFamily: 'Janna',
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.whiteColor,
        fontWeight: .w700,
        fontFamily: 'Janna',
      ),
    ),
  );
}
