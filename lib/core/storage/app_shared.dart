import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  final SharedPreferences _preferences;
  AppShared(this._preferences);

  // Key එක Product Objects සඳහා වෙනස් කිරීම
  static const String _keyFavoriteProducts = 'FAVORITE_PRODUCTS_JSON';

  // --- FAVORITE PRODUCTS METHODS ---

  /// Storage එකෙන් Saved JSON Strings List එක ලබා ගැනීම
  List<String> getFavoriteProductsJson() {
    return _preferences.getStringList(_keyFavoriteProducts) ?? [];
  }

  /// JSON Strings List එක Storage එකේ Save කිරීම
  Future<bool> saveFavoriteProductsJson(List<String> jsonList) async {
    return await _preferences.setStringList(_keyFavoriteProducts, jsonList);
  }

  /// All Storage Clear කිරීම
  Future<bool> clearAll() async {
    return await _preferences.clear();
  }
}
