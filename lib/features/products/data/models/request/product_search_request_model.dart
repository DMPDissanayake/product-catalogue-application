class ProductSearchRequestModel {
  final String query;
  final int page;
  final int limit;

  ProductSearchRequestModel({
    required this.query,
    this.page = 1,
    this.limit = 20,
  });

  Map<String, dynamic> toJson() {
    return {'q': query, 'page': page, 'limit': limit};
  }
}
