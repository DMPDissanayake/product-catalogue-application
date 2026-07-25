import 'package:product_catalogue_application/features/products/data/models/request/product_data_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_list_request_model.dart';
import 'package:product_catalogue_application/features/products/data/models/request/product_search_request_model.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product_detail.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductList(ProductListRequestModel request);
  Future<List<Product>> getProductSearch(ProductSearchRequestModel request);
  Future<ProductDetail> getProductData(ProductDataRequestModel request);
  Future<bool> toggleFavorite(Product product);
  Future<List<Product>> getFavoriteProducts();
}
