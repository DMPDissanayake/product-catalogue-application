import '../product_detail_model.dart';

class ProductDataResponseModel {
  final ProductDetailModel productData;

  ProductDataResponseModel({required this.productData});

  factory ProductDataResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDataResponseModel(
      productData: ProductDetailModel.fromJson(
        json['output'] ?? json['data'] ?? json,
      ),
    );
  }
}
