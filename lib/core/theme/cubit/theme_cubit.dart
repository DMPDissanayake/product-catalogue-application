import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalogue_application/core/storage/app_shared.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';
import 'package:product_catalogue_application/utils/enums.dart';

class ThemeCubit extends Cubit<ThemeType> {
  final AppShared appShared;

  ThemeCubit({required this.appShared}) : super(_getInitialTheme(appShared));

  static ThemeType _getInitialTheme(AppShared appShared) {
    final bool isDark = appShared.isDarkMode();
    final initialTheme = isDark ? ThemeType.DARK : ThemeType.LIGHT;
    AppColors.setTheme(initialTheme);
    return initialTheme;
  }

  void toggleTheme() async {
    final nextTheme = state == ThemeType.LIGHT
        ? ThemeType.DARK
        : ThemeType.LIGHT;
    await appShared.setDarkMode(nextTheme == ThemeType.DARK);
    AppColors.setTheme(nextTheme);
    emit(nextTheme);
  }
}
