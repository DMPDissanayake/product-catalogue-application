import 'dart:convert';

import 'package:product_catalogue_application/core/network/mock_models.dart';
import 'package:product_catalogue_application/features/products/data/models/product_model.dart';

import '../../../../services/favourites_storage_service.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_detail.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/products_remote_data_source.dart';
import '../models/request/product_data_request_model.dart';
import '../models/request/product_list_request_model.dart';
import '../models/request/product_search_request_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final FavouritesStorageService favouritesStorageService;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.favouritesStorageService,
  });

  @override
  Future<List<Product>> getProductList(ProductListRequestModel request) async {
    try {
      final favProducts = favouritesStorageService.getFavoriteProducts();
      final favoriteIds = favProducts.map((p) => p.id).toSet();
      final Map<String, dynamic> jsonMap = jsonDecode(
        MockModels.productListResponse,
      );
      final List<dynamic> jsonList = jsonMap['output'];

      List<ProductModel> productModels = jsonList
          .map((json) => ProductModel.fromJson(json))
          .toList();

      if (request.category != null && request.category != 'All') {
        productModels = productModels
            .where(
              (p) =>
                  p.category.toLowerCase() == request.category?.toLowerCase(),
            )
            .toList();
      }

      return productModels.map((model) {
        final isFav = favoriteIds.contains(model.id);
        return model.toEntity(isFav: isFav);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getProductSearch(
    ProductSearchRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.searchProducts(request);
      final favProducts = favouritesStorageService.getFavoriteProducts();
      final favoriteIds = favProducts.map((p) => p.id).toSet();

      return response.products.map((model) {
        final isFav = favoriteIds.contains(model.id);
        return model.toEntity(isFav: isFav);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductDetail> getProductData(ProductDataRequestModel request) async {
    try {
      final response = await remoteDataSource.getProductData(request);
      final isFav = favouritesStorageService.isFavorite(
        response.productData.id,
      );

      return response.productData.toEntity(isFav: isFav);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(Product product) async {
    try {
      await favouritesStorageService.toggleFavoriteProduct(product);
      return favouritesStorageService.isFavorite(product.id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    try {
      return favouritesStorageService.getFavoriteProducts();
    } catch (e) {
      rethrow;
    }
  }
}
