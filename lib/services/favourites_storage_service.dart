import 'dart:convert';
import 'package:product_catalogue_application/core/storage/app_shared.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/data/models/product_model.dart'; // ProductModel එක import කරගන්න

class FavouritesStorageService {
  final AppShared appShared;

  FavouritesStorageService({required this.appShared});

  List<Product> getFavoriteProducts() {
    final List<String> jsonStringList = appShared.getFavoriteProductsJson();
    return jsonStringList.map((jsonStr) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
      return ProductModel.fromJson(jsonMap).toEntity();
    }).toList();
  }

  Future<void> toggleFavoriteProduct(Product product) async {
    final List<Product> currentFavorites = getFavoriteProducts();
    final index = currentFavorites.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      currentFavorites.removeAt(index);
    } else {
      currentFavorites.add(product.copyWith(isFavorite: true));
    }

    final List<String> jsonStringList = currentFavorites.map((p) {
      final model = ProductModel.fromEntity(p);
      return jsonEncode(model.toJson());
    }).toList();
    await appShared.saveFavoriteProductsJson(jsonStringList);
  }

  bool isFavorite(String productId) {
    final favorites = getFavoriteProducts();
    return favorites.any((p) => p.id == productId);
  }
}
