class ProductDataRequestModel {
  final String productId;

  ProductDataRequestModel({required this.productId});

  Map<String, dynamic> toJson() {
    return {'product_id': productId};
  }
}
