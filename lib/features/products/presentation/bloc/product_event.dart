import 'package:equatable/equatable.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_data_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_list_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_search_request_model.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

/// Products List
class FetchProductListEvent extends ProductEvent {
  final ProductListRequestModel request;

  const FetchProductListEvent({required this.request});

  @override
  List<Object?> get props => [request];
}

/// Product Search
class SearchProductsEvent extends ProductEvent {
  final ProductSearchRequestModel request;

  const SearchProductsEvent({required this.request});

  @override
  List<Object?> get props => [request];
}

/// Single Product Detail
class FetchProductDetailEvent extends ProductEvent {
  final ProductDataRequestModel request;

  const FetchProductDetailEvent({required this.request});

  @override
  List<Object?> get props => [request];
}
