import 'package:product_catalogue_application/features/products/data/models/request/product_data_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_list_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_search_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/response/product_data_response_model.dart';
import 'package:product_catalogue_application/features/products/data/models/response/product_list_response_model.dart';
import 'package:product_catalogue_application/features/products/data/models/response/product_search_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductListResponseModel> getProductList(
    ProductListRequestModel request,
  );
  Future<ProductSearchResponseModel> searchProducts(
    ProductSearchRequestModel request,
  );
  Future<ProductDataResponseModel> getProductData(
    ProductDataRequestModel request,
  );
}
