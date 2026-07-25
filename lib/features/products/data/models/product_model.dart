import 'package:product_catalogue_application/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.category,
    required super.imageUrl,
    super.rating,
    super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
      imageUrl: json['imageUrl'] ?? json['image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  /// 🟢 එකතු කළ නව Method එක: Domain Entity එක Model එකක් කරගැනීමට
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      category: product.category,
      imageUrl: product.imageUrl,
      rating: product.rating,
      isFavorite: product.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }

  Product toEntity({bool? isFav}) {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      category: category,
      imageUrl: imageUrl,
      rating: rating,
      isFavorite:
          isFav ?? isFavorite, // `isFav` Pass නොකළොත් Model එකේ තියෙන අගයම ගනී
    );
  }
}
