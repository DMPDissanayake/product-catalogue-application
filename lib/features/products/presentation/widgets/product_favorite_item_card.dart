import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/catogary_laber_card.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';
import 'package:product_catalogue_application/utils/app_images.dart';

class ProductFavoriteItemCard extends StatelessWidget {
  final Product data;
  final VoidCallback onTapFavorite;
  final VoidCallback onTapCard;
  const ProductFavoriteItemCard({
    super.key,
    required this.onTapFavorite,
    required this.onTapCard,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Container(
        height: 120.h,
        margin: EdgeInsets.only(bottom: 8.h, left: 12.w, right: 12.w),
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1,
            color: AppColors.initColors().nonChangeWhite.withOpacity(0.9),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  data.imageUrl,
                  width: 80.h,
                  height: 80.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80.h,
                      height: 80.h,
                      color: AppColors.initColors().greyColor.withOpacity(0.2),
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.initColors().greyColor,
                        size: 30.r,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 12.w),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatogaryLaberCard(catogaryName: data.category),
                    SizedBox(height: 4.h),
                    Text(
                      data.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.kFontSize14,
                        height: AppDimensions.kLineHeight18(18),
                        letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                        color: AppColors.initColors().blackTextColor,
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      '\$${data.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.kFontSize16,
                        height: AppDimensions.kLineHeight18(18),
                        letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                        color: AppColors.initColors().greenColor,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onTapFavorite,
                child: SvgPicture.asset(
                  AppImages.svgFavoriteLike,
                  height: 24.h,
                  width: 24.h,
                  colorFilter: ColorFilter.mode(
                    AppColors.initColors().primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
