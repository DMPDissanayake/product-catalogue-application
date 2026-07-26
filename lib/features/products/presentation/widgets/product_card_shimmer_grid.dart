import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.initColors().nonChangeWhite,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: Color(0x1A000000), // Soft shadow
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        period: const Duration(milliseconds: 1500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Container(
                    height: 140.h,
                    width: double.infinity,
                    color: baseColor,
                  ),
                ),
                // Favorite icon placeholder
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    height: 36.h,
                    width: 36.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category label placeholder
                  Container(
                    height: 18.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Title line 1
                  Container(
                    height: 14.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  // Title line 2
                  Container(
                    height: 14.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Price placeholder
                  Container(
                    height: 16.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardShimmerGrid extends StatelessWidget {
  final int itemCount;

  const ProductCardShimmerGrid({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 20.h),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.67,
      ),
      itemBuilder: (context, index) => const ProductCardShimmer(),
    );
  }
}
