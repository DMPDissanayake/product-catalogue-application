import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().nonChangeWhite,
      //appBar: ProductAppBar(title: 'My Favorite'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: SafeArea(
          child: BlocProvider.value(
            value: _bloc,
            child: BlocListener<ProductBloc, ProductState>(
              listener: (_, state) {},
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          LoginBackIcon(),
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
                              letterSpacing: AppDimensions.kLetterSpacing14(
                                -2.5,
                              ),
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
                          // _bloc.add(SearchEvent(query)); // TODO: Add your search event here
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
                    ProductFavoriteItemCard(
                      onTapCard: () {
                        Navigator.pushNamed(
                          context,
                          Routes.kProductDetailesView,
                          arguments: ProductDitailesViewArgs(productId: 5),
                        );
                      },
                      onTapFavorite: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
