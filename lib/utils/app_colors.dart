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
    required this.tabBarColor,
    required this.greyColor,
    required this.greenColor,
    required this.likeColoe,
  });

  Color primaryColor;
  Color nonChangeWhite;
  Color nonChangeBlack;
  Color bottomNavigationBackgroundColor;
  LinearGradient appBGColor;
  Color blackTextColor;
  LinearGradient tabBarColor;
  Color greyColor;
  Color greenColor;
  Color likeColoe;

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
      tabBarColor: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFFFFFF), Color(0xFFFFFCF2), Color(0xFFFFF4D6)],
      ),
      greyColor: Colors.grey,
      greenColor: Colors.green,
      likeColoe: const Color(0xFFff00dd),
    );
  }

  static AppColors initializeDarkColors() {
    return AppColors(
      primaryColor: const Color(0xFFFFB400),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
      greyColor: Colors.grey,
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
      tabBarColor: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFFFFFF), Color(0xFFFFFCF2), Color(0xFFFFF4D6)],
      ),
      greenColor: Colors.lightGreenAccent,
      likeColoe: const Color(0xFFff00dd),
    );
  }
}
