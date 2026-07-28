import 'package:flutter/material.dart';

import '../../utils/enums.dart';

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
    required this.errorColor,
    required this.searchColor,
    required this.productCardColor,
    required this.backIconColor,
    required this.favoritCardColor,
    required this.errorMessageTextColor,
  });

  Color primaryColor;
  Color nonChangeWhite;
  Color nonChangeBlack;
  Color searchColor;
  Color bottomNavigationBackgroundColor;
  LinearGradient appBGColor;
  Color blackTextColor;
  LinearGradient tabBarColor;
  Color greyColor;
  Color greenColor;
  Color likeColoe;
  Color errorColor;
  Color productCardColor;
  Color backIconColor;
  Color favoritCardColor;
  Color errorMessageTextColor;

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
      productCardColor: Colors.white,
      favoritCardColor: Colors.white.withOpacity(0.7),
      searchColor: Colors.white,
      nonChangeBlack: Colors.black,
      backIconColor: Colors.black,
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
      errorColor: Colors.red,
      errorMessageTextColor: Colors.black,
    );
  }

  static AppColors initializeDarkColors() {
    return AppColors(
      primaryColor: const Color(0xFF1B1E23),
      nonChangeWhite: Colors.white,
      nonChangeBlack: Colors.black,
      searchColor: Colors.white.withOpacity(0.3),
      greyColor: Colors.grey,
      backIconColor: Colors.white,
      productCardColor: Colors.white.withOpacity(0.2),
      favoritCardColor: Colors.white.withOpacity(0.2),
      bottomNavigationBackgroundColor: const Color(0xFF1E1E1E), // Dark
      appBGColor: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF121212), Color(0xFF121212)],
      ),
      blackTextColor: const Color(0xFFFFFFFF),
      tabBarColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFFFFFF).withOpacity(0.2),
          const Color(0xFFFFFCF2).withOpacity(0.2),
          const Color(0xFFFFF4D6).withOpacity(0.2),
        ],
      ),
      greenColor: Colors.lightGreenAccent,
      likeColoe: const Color(0xFFff00dd),
      errorColor: Colors.redAccent,
      errorMessageTextColor: Colors.white,
    );
  }
}
