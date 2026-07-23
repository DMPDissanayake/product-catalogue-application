import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_images.dart';

class DarkLightButton extends StatefulWidget {
  final VoidCallback onPress;
  const DarkLightButton({super.key, required this.onPress});

  @override
  State<DarkLightButton> createState() => _DarkLightButtonState();
}

class _DarkLightButtonState extends State<DarkLightButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
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
          child: SvgPicture.asset(
            AppImages.svgDarkmode,
            height: 20.h,
            width: 20.h,
            colorFilter: ColorFilter.mode(
              AppColors.initColors().primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
