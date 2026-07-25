import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.rating = 0.0,
    this.isFavorite = false,
  });

  /// BLoC / State management වලදී object එක update කිරීමට
  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? category,
    String? imageUrl,
    double? rating,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
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
    isFavorite,
  ];
}
