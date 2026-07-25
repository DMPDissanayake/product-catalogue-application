import 'package:equatable/equatable.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product_detail.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductListLoadedState extends ProductState {
  final List<Product> products;

  const ProductListLoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductDetailLoadedState extends ProductState {
  final ProductDetail productDetail;

  const ProductDetailLoadedState({required this.productDetail});

  @override
  List<Object?> get props => [productDetail];
}

class ProductErrorState extends ProductState {
  final String message;

  const ProductErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
