import '../../domain/entities/product_detail.dart';

class ProductDetailModel extends ProductDetail {
  const ProductDetailModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.category,
    required super.imageUrl,
    super.rating,
    super.reviewsCount,
    super.isAvailable,
    super.isFavorite,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
      imageUrl: json['imageUrl'] ?? json['image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: json['reviewsCount'] ?? json['reviews_count'] ?? 0,
      isAvailable: json['isAvailable'] ?? json['is_available'] ?? true,
      isFavorite: json['isFavorite'] ?? false,
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
      'reviewsCount': reviewsCount,
      'isAvailable': isAvailable,
      'isFavorite': isFavorite,
    };
  }

  ProductDetail toEntity({bool isFav = false}) {
    return ProductDetail(
      id: id,
      title: title,
      description: description,
      price: price,
      category: category,
      imageUrl: imageUrl,
      rating: rating,
      reviewsCount: reviewsCount,
      isAvailable: isAvailable,
      isFavorite: isFav,
    );
  }
}
