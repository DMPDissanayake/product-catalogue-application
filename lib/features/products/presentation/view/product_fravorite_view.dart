import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';

class ProductFravoriteView extends StatefulWidget {
  const ProductFravoriteView({super.key});

  @override
  State<ProductFravoriteView> createState() => _ProductFravoriteViewState();
}

class _ProductFravoriteViewState extends State<ProductFravoriteView> {
  final ProductBloc _bloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    'Product Fravorite  View',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: AppDimensions.kFontSize14,
                      height: AppDimensions.kLineHeight14(14),
                      letterSpacing: AppDimensions.kLetterSpacing14(2),
                      color: AppColors.initColors().blackTextColor,
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
