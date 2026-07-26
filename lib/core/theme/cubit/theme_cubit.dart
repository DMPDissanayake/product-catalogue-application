import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';
import 'package:product_catalogue_application/utils/enums.dart';

class ThemeCubit extends Cubit<ThemeType> {
  ThemeCubit() : super(ThemeType.LIGHT);

  void toggleTheme() {
    final nextTheme = state == ThemeType.LIGHT
        ? ThemeType.DARK
        : ThemeType.LIGHT;
    AppColors.setTheme(nextTheme);
    emit(nextTheme);
  }
}
