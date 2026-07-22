import 'package:flutter/material.dart';

import 'enums.dart';

class AppColors {
  static ThemeType _currentTheme = ThemeType.LIGHT;

  AppColors({
    required this.primaryColor,
    required this.nonChangeWhite,
    required this.nonChangeBlack,
  });

  Color primaryColor;
  Color nonChangeWhite;
  Color nonChangeBlack;

  static AppColors initColors() {
    if (_currentTheme == ThemeType.LIGHT) {
      return initializeLightColors();
    } else {
      return initializeDarkColors();
    }
  }

  static void setTheme(ThemeType theme) {
    _currentTheme = theme;
  }

  static AppColors initializeLightColors() {
    return AppColors(
      primaryColor: const Color(0xFF1B1E23),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
    );
  }

  static AppColors initializeDarkColors() {
    return AppColors(
      primaryColor: const Color(0xFF1B1E23),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
    );
  }
}
