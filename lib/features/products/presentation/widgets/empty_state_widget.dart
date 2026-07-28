import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';
import 'package:product_catalogue_application/utils/app_animations.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String? message;

  const EmptyStateWidget({super.key, required this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAnimations.emptyBox,
              width: 120.w,
              height: 120.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 4.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: AppDimensions.kFontSize14,
                height: AppDimensions.kLineHeight14(14),
                letterSpacing: AppDimensions.kLetterSpacing14(1),
                color: AppColors.initColors().errorMessageTextColor,
              ),
            ),
            if (message != null) ...[
              SizedBox(height: 8.h),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimensions.kFontSize14,
                  height: AppDimensions.kLineHeight14(14),
                  letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                  color: AppColors.initColors().errorMessageTextColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
