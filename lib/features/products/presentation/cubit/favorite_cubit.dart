import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ProductRepository repository;

  FavoriteCubit({required this.repository}) : super(FavoriteInitial());

  /// Favorite Products
  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await repository.getFavoriteProducts();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError('Failed to load favorites'));
    }
  }

  /// Toggle Favorite
  Future<void> toggleFavorite(Product product) async {
    if (state is FavoriteLoaded) {
      final currentFavorites = List<Product>.from(
        (state as FavoriteLoaded).favoriteProducts,
      );
      final isExisting = currentFavorites.any((p) => p.id == product.id);
      if (isExisting) {
        currentFavorites.removeWhere((p) => p.id == product.id);
      } else {
        final updatedProduct = Product(
          id: product.id,
          title: product.title,
          description: product.description,
          price: product.price,
          category: product.category,
          imageUrl: product.imageUrl,
          rating: product.rating,
          isFavorite: true,
        );
        currentFavorites.add(updatedProduct);
      }
      emit(FavoriteLoaded(currentFavorites));
      try {
        await repository.toggleFavorite(product);
      } catch (e) {
        loadFavorites();
      }
    }
  }

  /// Product
  bool isFavorite(String productId) {
    if (state is FavoriteLoaded) {
      return (state as FavoriteLoaded).favoriteProducts.any(
        (p) => p.id == productId,
      );
    }
    return false;
  }
}
