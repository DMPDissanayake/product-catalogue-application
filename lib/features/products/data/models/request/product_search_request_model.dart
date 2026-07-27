class ProductSearchRequestModel {
  final String query;
  final int page;
  final int limit;
  final String? category;

  ProductSearchRequestModel({
    required this.query,
    this.page = 1,
    this.limit = 20,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'q': query,
      'page': page,
      'limit': limit,
      if (category != null) 'category': category,
    };
  }
}
