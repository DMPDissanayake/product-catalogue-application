import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/core/theme/cubit/theme_cubit.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_list_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_search_request_model.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_event.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_state.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_cubit.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_state.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/empty_state_widget.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/dark_light_button.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_card_shimmer_grid.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/product_tab_bar_widget.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_detailes_view.dart';
import 'package:product_catalogue_application/features/products/presentation/widgets/search_text_field.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';
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
  late final ProductBloc _bloc;
  late final FavoriteCubit _favoriteCubit;
  late final ThemeCubit _themeCubit;

  int _selectedIndex = 0;

  int _currentPage = 1;
  final int _limit = 20;

  int _requestId = 0;

  List<Product> _products = [];
  bool _isLoading = true;
  bool _isMoreLoading = false;
  bool _hasMoreData = true;
  String? _errorMessage;

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  static const List<String> _tabs = [
    'All',
    'Electronics',
    'Fashion',
    'Home',
    'Beauty',
    'Sports',
    'Books',
  ];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ProductBloc>();
    _favoriteCubit = context.read<FavoriteCubit>();
    _themeCubit = context.read<ThemeCubit>();
    _fetchProducts();
    _scrollController.addListener(_onScroll);
  }

  void _fetchProducts() {
    final requestId = ++_requestId;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _products.clear();
    });
    _currentPage = 1;
    _hasMoreData = true;
    final selectedCategory = _tabs[_selectedIndex];
    _bloc.add(
      FetchProductListEvent(
        requestId: requestId,
        request: ProductListRequestModel(
          limit: _limit,
          page: _currentPage,
          category: selectedCategory == 'All' ? null : selectedCategory,
        ),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        !_isMoreLoading &&
        _hasMoreData &&
        _searchController.text.trim().isEmpty) {
      _fetchMoreProducts();
    }
  }

  void _fetchMoreProducts() {
    setState(() => _isMoreLoading = true);
    _currentPage++;
    final selectedCategory = _tabs[_selectedIndex];
    _bloc.add(
      FetchProductListEvent(
        requestId: _requestId,
        request: ProductListRequestModel(
          limit: _limit,
          page: _currentPage,
          category: selectedCategory == 'All' ? null : selectedCategory,
        ),
      ),
    );
  }

  void _search(String query) {
    final trimmedQuery = query.trim();
    final selectedCategory = _tabs[_selectedIndex];

    if (trimmedQuery.isEmpty) {
      _fetchProducts();
      return;
    }

    final requestId = ++_requestId;
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _currentPage = 1;
      _hasMoreData = false;
    });
    _bloc.add(
      SearchProductsEvent(
        requestId: requestId,
        request: ProductSearchRequestModel(
          query: trimmedQuery,
          category: selectedCategory == 'All' ? null : selectedCategory,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().nonChangeWhite,
      floatingActionButton: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, favState) {
          final count = favState is FavoriteLoaded
              ? favState.favoriteProducts.length
              : 0;
          return ProductFavoriteButton(
            favoriteCount: count,
            onClick: () {
              Navigator.pushNamed(context, Routes.kProductFravoriteView).then((
                _,
              ) {
                _fetchProducts();
              });
            },
          );
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.initColors().appBGColor),
        child: SafeArea(
          child: BlocListener<ProductBloc, ProductState>(
            listener: (_, state) {
              if (state is ProductLoadingState) {
                if (_currentPage == 1) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                }
              } else if (state is ProductListLoadedState) {
                if (state.requestId != _requestId) return;
                setState(() {
                  _isLoading = false;
                  _isMoreLoading = false;

                  if (state.products.length < _limit) {
                    _hasMoreData = false;
                  }
                  if (_currentPage == 1) {
                    _products = List.from(state.products);
                  } else {
                    final newProducts = state.products
                        .where((newP) => !_products.any((p) => p.id == newP.id))
                        .toList();
                    _products.addAll(newProducts);
                  }
                  _errorMessage = null;
                });
              } else if (state is ProductErrorState) {
                setState(() {
                  _isLoading = false;
                  _isMoreLoading = false;
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
                      DarkLightButton(
                        onPress: () {
                          _themeCubit.toggleTheme();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SearchTextField(
                    controller: _searchController,
                    hintText: "Search products...",
                    onSearch: (query) => _search(query),
                  ),
                ),
                SizedBox(height: 12.h),
                ProductTabBarWidget(
                  tabs: _tabs,
                  selectedIndex: _selectedIndex,
                  onTabSelected: (index) {
                    if (_selectedIndex != index) {
                      setState(() => _selectedIndex = index);
                      if (_scrollController.hasClients) {
                        _scrollController.jumpTo(0);
                      }
                      _search(_searchController.text);
                    }
                  },
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: _isLoading
                      ? const ProductCardShimmerGrid()
                      : !_isLoading && _products.isEmpty
                      ? EmptyStateWidget(
                          title: _errorMessage ?? "No Products Found",
                          message: _errorMessage != null
                              ? "There was an issue fetching products. Please try again."
                              : "No products match your current search or filter.",
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: RefreshIndicator(
                                color: AppColors.initColors().primaryColor,
                                backgroundColor:
                                    AppColors.initColors().nonChangeWhite,
                                onRefresh: () async => _fetchProducts(),
                                child: GridView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  controller: _scrollController,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ).copyWith(bottom: 20.h),
                                  itemCount: _products.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16.w,
                                        mainAxisSpacing: 16.h,
                                        childAspectRatio: 0.67,
                                      ),
                                  itemBuilder: (context, index) {
                                    final product = _products[index];

                                    return BlocBuilder<
                                      FavoriteCubit,
                                      FavoriteState
                                    >(
                                      builder: (context, favState) {
                                        final isFav = _favoriteCubit.isFavorite(
                                          product.id,
                                        );

                                        return ProductCard(
                                          key: ValueKey(product.id),
                                          data: product,
                                          isFavorite: isFav,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              Routes.kProductDetailesView,
                                              arguments:
                                                  ProductDitailesViewArgs(
                                                    productId: product.id,
                                                  ),
                                            ).then((_) {
                                              _fetchProducts();
                                            });
                                          },
                                          onTapFavorite: () {
                                            _favoriteCubit.toggleFavorite(
                                              product,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (_isMoreLoading)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: Center(
                                  child: SizedBox(
                                    height: 24.h,
                                    width: 24.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color:
                                          AppColors.initColors().primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
