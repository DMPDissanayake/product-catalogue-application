import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';
import 'package:product_catalogue_application/utils/app_images.dart';

class ProductFavoriteButton extends StatefulWidget {
  final int favoriteCount;
  final VoidCallback onClick;

  const ProductFavoriteButton({
    super.key,
    required this.favoriteCount,
    required this.onClick,
  });

  @override
  State<ProductFavoriteButton> createState() => _ProductFavoriteButtonState();
}

class _ProductFavoriteButtonState extends State<ProductFavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      borderRadius: BorderRadius.circular(100.r),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Main Circular Heart Button
          Container(
            height: 65.h,
            width: 65.h,
            decoration: BoxDecoration(
              color: AppColors.initColors().primaryColor,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  color: Color(0x29000000),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                AppImages.svgFavorite,
                height: 30.h,
                width: 30.h,
                colorFilter: ColorFilter.mode(
                  AppColors.initColors().nonChangeWhite,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          if (widget.favoriteCount > 0 && widget.favoriteCount <= 50)
            Positioned(
              top: -2.h,
              right: -2.h,
              child: Container(
                padding: EdgeInsets.all(4.r),
                constraints: BoxConstraints(minWidth: 18.w, minHeight: 18.h),
                decoration: BoxDecoration(
                  color: AppColors.initColors().nonChangeWhite,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.initColors().primaryColor,
                    width: 1.5.r,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${widget.favoriteCount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.favoriteCount < 10
                          ? AppDimensions.kFontSize12
                          : AppDimensions.kFontSize10,
                      color: AppColors.initColors().primaryColor,
                    ),
                  ),
                ),
              ),
            ),

          if (widget.favoriteCount > 50)
            Positioned(
              top: -2.h,
              right: -2.h,
              child: Container(
                padding: EdgeInsets.all(4.r),
                constraints: BoxConstraints(minWidth: 18.w, minHeight: 18.h),
                decoration: BoxDecoration(
                  color: AppColors.initColors().nonChangeWhite,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.initColors().primaryColor,
                    width: 1.5.r,
                  ),
                ),
                child: Center(
                  child: Text(
                    '50\u207A',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimensions.kFontSize10,
                      color: AppColors.initColors().primaryColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
