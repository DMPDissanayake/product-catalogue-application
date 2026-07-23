import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/dark_light_button.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_tab_bar_widget.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_detailes_view.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/search_text_field.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_images.dart';
import 'package:product_catalogue_application/utils/navigation_routes.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_favoeite_button.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/praduct_card.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductBloc _bloc = ProductBloc();
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  final List<String> _tabs = [
    "All",
    "Electronics",
    "Clothing",
    "Home",
    "Accessories",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().nonChangeWhite,
      floatingActionButton: ProductFavoriteButton(
        favoriteCount: 5,
        onClick: () {
          Navigator.pushNamed(context, Routes.kProductFravoriteView);
        },
      ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.svgPrductList,
                              height: 24.h,
                              width: 24.h,
                              colorFilter: ColorFilter.mode(
                                AppColors.initColors().blackTextColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Discover Products',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppDimensions.kFontSize22,
                                height: AppDimensions.kLineHeight22(22),
                                letterSpacing: AppDimensions.kLetterSpacing14(
                                  -2.5,
                                ),
                                color: AppColors.initColors().blackTextColor,
                              ),
                            ),
                          ],
                        ),
                        DarkLightButton(onPress: () {}),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SearchTextField(
                      controller: _searchController,
                      hintText: "Search products...",
                      onSearch: (query) {
                        // _bloc.add(SearchEvent(query)); // TODO: Add your search event here
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ProductTabBarWidget(
                    tabs: _tabs,
                    selectedIndex: _selectedIndex,
                    onTabSelected: (index) {
                      setState(() => _selectedIndex = index);
                    },
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ).copyWith(bottom: 80.h),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.67,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          price: 199.99 + (index * 10),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.kProductDetailesView,
                              arguments: ProductDitailesViewArgs(productId: 5),
                            );
                          },
                        );
                      },
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
