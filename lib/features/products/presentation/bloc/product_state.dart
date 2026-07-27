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
  final int requestId;

  const ProductListLoadedState({required this.products, this.requestId = 0});

  @override
  List<Object?> get props => [products, requestId];
}

class ProductDetailLoadedState extends ProductState {
  final ProductDetail productDetail;

  const ProductDetailLoadedState({required this.productDetail});

  @override
  List<Object?> get props => [productDetail];
}

class ProductErrorState extends ProductState {
  final String message;
  final int requestId;

  const ProductErrorState({required this.message, this.requestId = 0});

  @override
  List<Object?> get props => [message, requestId];
}
