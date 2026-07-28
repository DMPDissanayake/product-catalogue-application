import '../product_model.dart';

class ProductListResponseModel {
  final List<ProductModel> products;
  final int totalResults;
  final int totalPages;

  ProductListResponseModel({
    required this.products,
    required this.totalResults,
    required this.totalPages,
  });

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductListResponseModel(
      products:
          (json['data'] as List?)
              ?.map((item) => ProductModel.fromJson(item))
              .toList() ??
          [],
      totalResults: json['total_results'] ?? 0,
      totalPages: json['total_pages'] ?? 1,
    );
  }
}
