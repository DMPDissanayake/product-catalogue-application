import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';
import 'package:product_catalogue_application/core/theme/cubit/theme_cubit.dart';
import 'package:product_catalogue_application/utils/app_images.dart';
import 'package:product_catalogue_application/utils/enums.dart';

class DarkLightButton extends StatelessWidget {
  final VoidCallback onPress;
  const DarkLightButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeCubit>().state;
    final isDark = currentTheme == ThemeType.DARK;

    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            width: 1,
            color: AppColors.initColors().nonChangeWhite.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.initColors().nonChangeBlack.withOpacity(0.12),
              offset: const Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: SvgPicture.asset(
              isDark ? AppImages.svgLight : AppImages.svgDarkmode,
              key: ValueKey<bool>(isDark),
              height: 20.h,
              width: 20.h,
              colorFilter: ColorFilter.mode(
                AppColors.initColors().primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
