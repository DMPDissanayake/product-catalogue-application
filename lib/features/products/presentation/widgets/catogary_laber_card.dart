import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';

class CatogaryLaberCard extends StatelessWidget {
  final String catogaryName;
  const CatogaryLaberCard({super.key, required this.catogaryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.initColors().primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        catogaryName,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppDimensions.kFontSize12,
          height: AppDimensions.kLineHeight18(18),
          letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
          color: AppColors.initColors().nonChangeWhite,
        ),
      ),
    );
  }
}
