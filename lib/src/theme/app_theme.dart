import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Colors.blue;
  static const Color scaffoldBackgroundColor = Colors.white;
  static const Color accentColor = Color(0xfffafafa);
  static const Color containerColor = Color(0xffeeeeee);
  static const Color shippingBackgroundColor = Color(0xfff4f4ea);
  static const Color shippingTextColor = Color(0xff946120);
  static const Color textColor = Colors.black;
  static const Color whiteColor = Color(0xffffffff);
  static const Color grayColor = Color(0xff191919);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: whiteColor,
        secondary: accentColor,
        secondaryContainer: grayColor,
        tertiary: containerColor,
        surface: shippingBackgroundColor,
        surfaceTint: shippingTextColor,
        onSurface: shippingTextColor,
        scrim: textColor,
      ),
    );
  }
}
