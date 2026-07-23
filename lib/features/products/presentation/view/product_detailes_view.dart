import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/Product_app_button.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/catogary_laber_card.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_app_bar.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';
import 'package:product_catalogue_application/utils/app_images.dart';

class ProductDitailesViewArgs {
  final int productId;
  ProductDitailesViewArgs({required this.productId});
}

class ProductDetailesView extends StatefulWidget {
  final ProductDitailesViewArgs args;
  const ProductDetailesView({super.key, required this.args});

  @override
  State<ProductDetailesView> createState() => _ProductDetailesViewState();
}

class _ProductDetailesViewState extends State<ProductDetailesView> {
  final ProductBloc _bloc = ProductBloc();
  bool _isDescriptionExpanded = false;
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(title: 'Product Details'),
      backgroundColor: AppColors.initColors().nonChangeWhite,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: SafeArea(
          child: BlocProvider.value(
            value: _bloc,
            child: BlocListener<ProductBloc, ProductState>(
              listener: (_, state) {},
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(36.r),
                          ),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
                            height: 400.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 400.h,
                                width: double.infinity,
                                color: AppColors.initColors().greyColor
                                    .withOpacity(0.2),
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  color: AppColors.initColors().greyColor,
                                  size: 50.r,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CatogaryLaberCard(catogaryName: 'Electronics'),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.svgStart,
                                    height: 20.h,
                                    width: 20.h,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.initColors().primaryColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.kFontSize12,
                                      height: AppDimensions.kLineHeight18(18),
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(-2.5),
                                      color:
                                          AppColors.initColors().blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aurora Pro Wireless Noise-Cancelling Headphones',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppDimensions.kFontSize18,
                                  height: AppDimensions.kLineHeight18(18),
                                  letterSpacing: AppDimensions.kLetterSpacing14(
                                    -2.5,
                                  ),
                                  color: AppColors.initColors().blackTextColor,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                '\$99.99',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppDimensions.kFontSize30,
                                  height: AppDimensions.kLineHeight18(18),
                                  letterSpacing: AppDimensions.kLetterSpacing14(
                                    -2.5,
                                  ),
                                  color: AppColors.initColors().greenColor,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Container(
                                height:
                                    2, // This is the thickness of the divider
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.initColors().nonChangeBlack
                                          .withOpacity(0.01),
                                      AppColors.initColors().nonChangeBlack
                                          .withOpacity(0.2),
                                      AppColors.initColors().nonChangeBlack
                                          .withOpacity(0.01),
                                    ],
                                    stops: const [0.1, 0.5, 0.9],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.kFontSize18,
                                  height: AppDimensions.kLineHeight18(18),
                                  letterSpacing: AppDimensions.kLetterSpacing14(
                                    -2.5,
                                  ),
                                  color: AppColors.initColors().blackTextColor,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Immerse yourself in studio-grade sound with adaptive active noise cancellation that adjusts to your environment in real time. The plush memory-foam ear cushions and lightweight frame make marathon listening sessions effortless. Enjoy up to 40 hours of battery life on a single charge, with a quick 10-minute top-up delivering five extra hours. Seamless multipoint pairing keeps you connected to your phone and laptop at once. Immerse yourself in studio-grade sound with adaptive active noise cancellation that adjusts to your environment in real time. The plush memory-foam ear cushions and lightweight frame make marathon listening sessions effortless. Enjoy up to 40 hours of battery life on a single charge, with a quick 10-minute top-up delivering five extra hours. Seamless multipoint pairing keeps you connected to your phone and laptop at once.',
                                    maxLines: _isDescriptionExpanded ? null : 5,
                                    overflow: _isDescriptionExpanded
                                        ? null
                                        : TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppDimensions.kFontSize14,
                                      height: 1.5,
                                      letterSpacing:
                                          AppDimensions.kLetterSpacing14(1),
                                      color: AppColors.initColors()
                                          .blackTextColor
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isDescriptionExpanded =
                                            !_isDescriptionExpanded;
                                      });
                                    },
                                    child: Text(
                                      _isDescriptionExpanded
                                          ? 'See less'
                                          : 'See more',
                                      style: TextStyle(
                                        color: AppColors.initColors()
                                            .blackTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 100.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16.h,
                    left: 16.w,
                    right: 16.w,
                    child: ProductAppButton(
                      onTapButton: () {
                        setState(() {
                          _isFavourite = !_isFavourite;
                        });
                      },
                      buttonText: _isFavourite
                          ? 'Remove from Favorites'
                          : 'Add to Favorites',
                      textColor: _isFavourite
                          ? AppColors.initColors().nonChangeBlack
                          : AppColors.initColors().nonChangeWhite,
                      borderColor: _isFavourite
                          ? AppColors.initColors().nonChangeBlack
                          : Colors.transparent,
                      buttonColor: _isFavourite
                          ? AppColors.initColors().nonChangeWhite
                          : AppColors.initColors().primaryColor,
                      prefixIcon: SvgPicture.asset(
                        _isFavourite
                            ? AppImages.svgFavoriteLike
                            : AppImages.svgFavorite,
                        height: 22.h,
                        colorFilter: ColorFilter.mode(
                          _isFavourite
                              ? AppColors.initColors().primaryColor
                              : AppColors.initColors().nonChangeWhite,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
