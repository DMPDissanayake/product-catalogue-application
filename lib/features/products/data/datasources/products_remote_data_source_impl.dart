import '../../../../core/network/api_helper.dart';
import '../models/request/product_data_request_model.dart';
import '../models/request/product_list_request_model.dart';
import '../models/request/product_search_request_model.dart';
import '../models/response/product_data_response_model.dart';
import '../models/response/product_list_response_model.dart';
import '../models/response/product_search_response_model.dart';
import 'products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiHelper apiHelper;

  ProductsRemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<ProductListResponseModel> getProductList(
    ProductListRequestModel request,
  ) async {
    try {
      final response = await apiHelper.post(
        "product/list",
        body: request.toJson(),
      );
      return ProductListResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<ProductSearchResponseModel> searchProducts(
    ProductSearchRequestModel request,
  ) async {
    try {
      final response = await apiHelper.post(
        "product/search",
        body: request.toJson(),
      );
      return ProductSearchResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<ProductDataResponseModel> getProductData(
    ProductDataRequestModel request,
  ) async {
    try {
      final response = await apiHelper.post(
        "product/data",
        body: request.toJson(),
      );
      return ProductDataResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
