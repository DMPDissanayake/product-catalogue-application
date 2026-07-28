import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final int reviewsCount;
  final bool isAvailable;
  final bool isFavorite;

  const ProductDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.rating = 0.0,
    this.reviewsCount = 0,
    this.isAvailable = true,
    this.isFavorite = false,
  });

  ProductDetail copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? category,
    String? imageUrl,
    double? rating,
    int? reviewsCount,
    bool? isAvailable,
    bool? isFavorite,
  }) {
    return ProductDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      isAvailable: isAvailable ?? this.isAvailable,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    category,
    imageUrl,
    rating,
    reviewsCount,
    isAvailable,
    isFavorite,
  ];
}
