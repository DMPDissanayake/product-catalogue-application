class ProductListRequestModel {
  final int page;
  final int limit;
  final String? category;

  ProductListRequestModel({this.page = 1, this.limit = 20, this.category});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'page': page, 'limit': limit};
    if (category != null && category!.isNotEmpty && category != 'All') {
      data['category'] = category;
    }
    return data;
  }
}
