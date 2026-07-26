import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_cubit.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_state.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_detailes_view.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_app_bar.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_favorite_item_card.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_tab_bar_widget.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/search_text_field.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';
import 'package:product_catalogue_application/utils/app_images.dart';
import 'package:product_catalogue_application/utils/navigation_routes.dart';

class ProductFravoriteView extends StatefulWidget {
  const ProductFravoriteView({super.key});

  @override
  State<ProductFravoriteView> createState() => _ProductFravoriteViewState();
}

class _ProductFravoriteViewState extends State<ProductFravoriteView> {
  late final FavoriteCubit _favoriteCubit;
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;
  static const List<String> _tabs = [
    'All',
    'Electronics',
    'Fashion',
    'Home',
    'Beauty',
    'Sports',
    'Books',
    'Groceries',
  ];

  @override
  void initState() {
    super.initState();
    _favoriteCubit = context.read<FavoriteCubit>();
  }

  List<Product> _getFilteredProducts(List<Product> favorites) {
    final selectedCategory = _tabs[_selectedIndex];
    final searchQuery = _searchController.text.toLowerCase().trim();

    return favorites.where((product) {
      final matchesCategory =
          selectedCategory == "All" ||
          (product.category?.toLowerCase() == selectedCategory.toLowerCase());

      final matchesSearch =
          searchQuery.isEmpty ||
          product.title.toLowerCase().contains(searchQuery);

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().nonChangeWhite,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    const LoginBackIcon(),
                    SizedBox(width: 24.w),
                    SvgPicture.asset(
                      AppImages.svgFavorite,
                      height: 20.h,
                      width: 20.h,
                      colorFilter: ColorFilter.mode(
                        AppColors.initColors().blackTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'My Favorites',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.kFontSize18,
                        height: AppDimensions.kLineHeight22(22),
                        letterSpacing: AppDimensions.kLetterSpacing14(-2.5),
                        color: AppColors.initColors().blackTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SearchTextField(
                  controller: _searchController,
                  hintText: "Search my favorite products...",
                  onSearch: (query) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 16.h),
              ProductTabBarWidget(
                tabs: _tabs,
                selectedIndex: _selectedIndex,
                onTabSelected: (index) {
                  setState(() => _selectedIndex = index);
                },
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    List<Product> allFavorites = [];
                    if (state is FavoriteLoaded) {
                      allFavorites = state.favoriteProducts;
                    }
                    final filteredProducts = _getFilteredProducts(allFavorites);
                    if (filteredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          "No favorite products found",
                          style: TextStyle(
                            color: AppColors.initColors().blackTextColor,
                            fontSize: AppDimensions.kFontSize14,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: filteredProducts.length,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: ProductFavoriteItemCard(
                            data: product,
                            onTapCard: () {
                              Navigator.pushNamed(
                                context,
                                Routes.kProductDetailesView,
                                arguments: ProductDitailesViewArgs(
                                  productId: product.id,
                                ),
                              );
                            },
                            onTapFavorite: () {
                              _favoriteCubit.toggleFavorite(product);
                            },
                          ),
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
    );
  }
}
