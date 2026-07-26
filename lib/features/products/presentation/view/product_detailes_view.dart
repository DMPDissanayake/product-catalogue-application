import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_data_request_model.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product_detail.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_event.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_state.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_cubit.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_state.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/Product_app_button.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/catogary_laber_card.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_app_bar.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_detailes_view_shimmer.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';
import 'package:product_catalogue_application/utils/app_images.dart';

class ProductDitailesViewArgs {
  final String productId;
  ProductDitailesViewArgs({required this.productId});
}

class ProductDetailesView extends StatefulWidget {
  final ProductDitailesViewArgs args;
  const ProductDetailesView({super.key, required this.args});

  @override
  State<ProductDetailesView> createState() => _ProductDetailesViewState();
}

class _ProductDetailesViewState extends State<ProductDetailesView> {
  late final ProductBloc _bloc;
  late final FavoriteCubit _favoriteCubit;

  bool _isDescriptionExpanded = false;

  bool _isLoading = false;
  ProductDetail? _productDetail;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ProductBloc>();
    _favoriteCubit = context.read<FavoriteCubit>();
    _bloc.add(
      FetchProductDetailEvent(
        request: ProductDataRequestModel(productId: widget.args.productId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(
        title: 'Product Details',
        onBackPressed: () {
          Navigator.pop(context, true);
        },
      ),
      backgroundColor: AppColors.initColors().nonChangeWhite,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: SafeArea(
          child: BlocListener<ProductBloc, ProductState>(
            listener: (_, state) {
              if (state is ProductLoadingState) {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
              } else if (state is ProductDetailLoadedState) {
                setState(() {
                  _isLoading = false;
                  _productDetail = state.productDetail;
                });
              } else if (state is ProductErrorState) {
                setState(() {
                  _isLoading = false;
                  _errorMessage = state.message;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.initColors().errorColor,
                  ),
                );
              }
            },
            child: Stack(
              children: [
                if (_errorMessage != null && _productDetail == null)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.initColors().errorColor,
                          fontSize: AppDimensions.kFontSize16,
                        ),
                      ),
                    ),
                  ),
                if (_productDetail != null)
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(36.r),
                          ),
                          child: Image.network(
                            _productDetail?.imageUrl ?? '',
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
                              CatogaryLaberCard(
                                catogaryName:
                                    _productDetail?.category ?? 'General',
                              ),
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
                                    _productDetail?.rating.toStringAsFixed(2) ??
                                        '',
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
                                _productDetail?.title ?? '',
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
                                '\$ ${_productDetail?.price.toStringAsFixed(2) ?? '0.00'}',
                                maxLines: 1,
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
                                    _productDetail?.description ?? '',
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
                if (_productDetail != null)
                  Positioned(
                    bottom: 16.h,
                    left: 16.w,
                    right: 16.w,
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, favState) {
                        final isFav = _favoriteCubit.isFavorite(
                          widget.args.productId,
                        );
                        return ProductAppButton(
                          onTapButton: () {
                            if (_productDetail != null) {
                              final product = Product(
                                id: _productDetail!.id,
                                title: _productDetail!.title,
                                price: _productDetail!.price,
                                description: _productDetail!.description,
                                category: _productDetail!.category,
                                imageUrl: _productDetail!.imageUrl,
                                rating: _productDetail!.rating,
                                isFavorite: isFav,
                              );
                              _favoriteCubit.toggleFavorite(product);
                            }
                          },
                          buttonText: isFav
                              ? 'Remove from Favorites'
                              : 'Add to Favorites',
                          textColor: isFav
                              ? AppColors.initColors().nonChangeBlack
                              : AppColors.initColors().nonChangeWhite,
                          borderColor: isFav
                              ? AppColors.initColors().nonChangeBlack
                              : Colors.transparent,
                          buttonColor: isFav
                              ? AppColors.initColors().nonChangeWhite
                              : AppColors.initColors().primaryColor,
                          prefixIcon: SvgPicture.asset(
                            isFav
                                ? AppImages.svgFavoriteLike
                                : AppImages.svgFavorite,
                            height: 22.h,
                            colorFilter: ColorFilter.mode(
                              isFav
                                  ? AppColors.initColors().primaryColor
                                  : AppColors.initColors().nonChangeWhite,
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (_isLoading) ProductDetailesViewShimmer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
