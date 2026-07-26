import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  final SharedPreferences _preferences;
  AppShared(this._preferences);

  // Key
  static const String _keyFavoriteProducts = 'FAVORITE_PRODUCTS_JSON';

  /// Storage List
  List<String> getFavoriteProductsJson() {
    return _preferences.getStringList(_keyFavoriteProducts) ?? [];
  }

  /// JSON Save
  Future<bool> saveFavoriteProductsJson(List<String> jsonList) async {
    return await _preferences.setStringList(_keyFavoriteProducts, jsonList);
  }

  /// Storage Clear
  Future<bool> clearAll() async {
    return await _preferences.clear();
  }
}
