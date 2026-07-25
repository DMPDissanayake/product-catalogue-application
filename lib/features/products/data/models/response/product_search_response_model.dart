import '../product_model.dart';

class ProductSearchResponseModel {
  final List<ProductModel> products;
  final int totalResults;

  ProductSearchResponseModel({
    required this.products,
    required this.totalResults,
  });

  factory ProductSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductSearchResponseModel(
      products:
          (json['data'] as List?)
              ?.map((item) => ProductModel.fromJson(item))
              .toList() ??
          [],
      totalResults: json['total_results'] ?? 0,
    );
  }
}
