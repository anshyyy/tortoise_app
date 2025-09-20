import 'package:flutter/material.dart';
import 'package:tortoise/src/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: _buildTextTheme(),
    );
  }

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      // SemiBold styles (FontWeight.w600)
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
        fontSize: 20,
      ),
      // Medium styles (FontWeight.w500)
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
        fontSize: 16,
      ),
    );
  }
}
