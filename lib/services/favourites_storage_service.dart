import 'dart:convert';
import 'package:product_catalogue_application/core/storage/app_shared.dart';
import 'package:product_catalogue_application/features/products/domain/entities/product.dart';
import 'package:product_catalogue_application/features/products/data/models/product_model.dart'; // ProductModel එක import කරගන්න

class FavouritesStorageService {
  final AppShared appShared;

  FavouritesStorageService({required this.appShared});

  /// Storage එකෙන් Saved Product Objects List එක Load කරගැනීම
  List<Product> getFavoriteProducts() {
    // SharedPreferences වලින් JSON String List එකක් ගන්නවා
    final List<String> jsonStringList = appShared.getFavoriteProductsJson();

    return jsonStringList.map((jsonStr) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
      // JSON එක Product Model එකකට Convert කරලා Product Domain Entity එකක් හදනවා
      return ProductModel.fromJson(jsonMap).toEntity();
    }).toList();
  }

  /// Whole Product Object එක Save / Remove (Toggle) කිරීම
  Future<void> toggleFavoriteProduct(Product product) async {
    final List<Product> currentFavorites = getFavoriteProducts();

    final index = currentFavorites.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      // තිබුනොත් අයින් කරනවා
      currentFavorites.removeAt(index);
    } else {
      // නැත්නම් Add කරනවා (isFavorite: true කරලා)
      currentFavorites.add(product.copyWith(isFavorite: true));
    }

    // List<Product> එක List<String> (JSON String) බවට හරවනවා Save කරන්න
    final List<String> jsonStringList = currentFavorites.map((p) {
      // Product entity එක Model එකක් කරලා Map එකක් බවට හරවනවා (toJson)
      final model = ProductModel.fromEntity(p);
      return jsonEncode(model.toJson());
    }).toList();

    // SharedPreferences වල Save කරනවා
    await appShared.saveFavoriteProductsJson(jsonStringList);
  }

  /// Specific Product එකක් Favorite ද කියල Check කිරීම
  bool isFavorite(String productId) {
    final favorites = getFavoriteProducts();
    return favorites.any((p) => p.id == productId);
  }
}
