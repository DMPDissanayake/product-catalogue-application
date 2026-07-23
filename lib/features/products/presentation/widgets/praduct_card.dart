import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/catogary_laber_card.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';

class ProductCard extends StatefulWidget {
  final double price;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.price, required this.onTap});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.initColors().nonChangeWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: Color(0x29000000),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                  child: Container(
                    height: 140.h,
                    width: double.infinity,
                    color: AppColors.initColors().greyColor,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported_outlined,
                        size: 40.r,
                        color: AppColors.initColors().greyColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    borderRadius: BorderRadius.circular(100.r),
                    child: Container(
                      height: 36.h,
                      width: 36.h,
                      decoration: BoxDecoration(
                        color: AppColors.initColors().nonChangeBlack
                            .withOpacity(0.3),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1F000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite
                              ? AppColors.initColors().primaryColor
                              : AppColors.initColors().greyColor,
                          size: 20.r,
                        ),
                      ),
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
                  CatogaryLaberCard(catogaryName: 'Electronics'),
                  SizedBox(height: 8.h),
                  Text(
                    'Aura Wireless Noise-Cancelling Headphones',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimensions.kFontSize14,
                      height: AppDimensions.kLineHeight18(18),
                      letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                      color: AppColors.initColors().blackTextColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.initColors().primaryColor,
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
