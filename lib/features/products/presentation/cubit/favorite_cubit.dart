import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ProductRepository repository;

  FavoriteCubit({required this.repository}) : super(FavoriteInitial());

  /// Favorite Products ටික Storage එකෙන් Load කිරීම
  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await repository.getFavoriteProducts();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError('Failed to load favorites'));
    }
  }

  /// Toggle Favorite (Optimistic UI Update සමඟ)
  Future<void> toggleFavorite(Product product) async {
    if (state is FavoriteLoaded) {
      final currentFavorites = List<Product>.from(
        (state as FavoriteLoaded).favoriteProducts,
      );
      final isExisting = currentFavorites.any((p) => p.id == product.id);

      // 1. UI එකට Instant Update එකක් දෙනවා (Optimistic Update)
      if (isExisting) {
        currentFavorites.removeWhere((p) => p.id == product.id);
      } else {
        // favorite list එකට එකතු කරද්දී `isFavorite = true` කරලා එකතු කරනවා
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

      // 2. Storage/Backend එකේ Toggle කිරීම
      try {
        await repository.toggleFavorite(product);
      } catch (e) {
        // Error එකක් ආවොත් Rollback කිරීම සඳහා පරණ Data Re-load කිරීම
        loadFavorites();
      }
    }
  }

  /// Product එකක් Favorite ද නැද්ද යන්න check කිරීම
  bool isFavorite(String productId) {
    if (state is FavoriteLoaded) {
      return (state as FavoriteLoaded).favoriteProducts.any(
        (p) => p.id == productId,
      );
    }
    return false;
  }
}
