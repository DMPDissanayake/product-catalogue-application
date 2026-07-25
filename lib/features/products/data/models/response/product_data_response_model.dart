import '../product_detail_model.dart';

class ProductDataResponseModel {
  final ProductDetailModel productData;

  ProductDataResponseModel({required this.productData});

  factory ProductDataResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDataResponseModel(
      // 🟢 'output' හෝ 'data' කියන keys දෙකෙන්ම data එක ගන්න පුළුවන් විදිහට හැදුවා
      productData: ProductDetailModel.fromJson(
        json['output'] ?? json['data'] ?? json,
      ),
    );
  }
}
