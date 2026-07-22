import 'package:flutter/material.dart';

import 'enums.dart';

class AppColors {
  static ThemeType _currentTheme = ThemeType.LIGHT;

  AppColors({
    required this.primaryColor,
    required this.nonChangeWhite,
    required this.nonChangeBlack,
    required this.bottomNavigationBackgroundColor,
    required this.appBGColor,
    required this.blackTextColor,
  });

  Color primaryColor;
  Color nonChangeWhite;
  Color nonChangeBlack;
  Color bottomNavigationBackgroundColor;
  LinearGradient appBGColor;
  Color blackTextColor;

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
      primaryColor: const Color(0xFFFFB400),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
      bottomNavigationBackgroundColor: Colors.white,

      appBGColor: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFB400).withOpacity(0.4), // 0%
          Color(0xFFffffff), // 100%
        ],
      ),
      blackTextColor: const Color(0xFF0F0F0F),
    );
  }

  static AppColors initializeDarkColors() {
    return AppColors(
      primaryColor: const Color(0xFFFFB400),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
      bottomNavigationBackgroundColor: Colors.white,
      appBGColor: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFB400).withOpacity(0.4), // 0%
          Color(0xFFffffff), // 100%
        ],
      ),
      blackTextColor: const Color(0xFF0F0F0F),
    );
  }
}
