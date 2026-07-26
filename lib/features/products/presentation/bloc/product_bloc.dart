import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_catalogue_application/features/products/domain/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository})
    : super(ProductInitialState()) {
    on<FetchProductListEvent>(_onFetchProductList);
    on<SearchProductsEvent>(_onSearchProducts);
    on<FetchProductDetailEvent>(_onFetchProductDetail);
  }

  Future<void> _onFetchProductList(
    FetchProductListEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (event.request.page == 1) {
      emit(ProductLoadingState());
    }
    try {
      final products = await productRepository.getProductList(event.request);
      if (event.request.page == 1) {
        await Future.delayed(const Duration(milliseconds: 300));
      }

      emit(ProductListLoadedState(products: products));
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    try {
      final products = await productRepository.getProductSearch(event.request);
      emit(ProductListLoadedState(products: products));
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }

  Future<void> _onFetchProductDetail(
    FetchProductDetailEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    try {
      final productDetail = await productRepository.getProductData(
        event.request,
      );
      emit(ProductDetailLoadedState(productDetail: productDetail));
    } catch (e) {
      emit(ProductErrorState(message: e.toString()));
    }
  }
}
