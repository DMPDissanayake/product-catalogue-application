import 'dart:convert';
import 'api_helper.dart';
import 'mock_models.dart';

class MockAPIHelper implements ApiHelper {
  @override
  Future<dynamic> post(String url, {required dynamic body}) async {
    await Future.delayed(const Duration(seconds: 2));
    String? productId;
    if (body is Map) {
      productId = (body['product_id'] ?? body['productId'] ?? body['id'])
          ?.toString();
    } else if (body is String) {
      try {
        final decoded = jsonDecode(body);
        if (decoded is Map) {
          productId =
              (decoded['product_id'] ?? decoded['productId'] ?? decoded['id'])
                  ?.toString();
        }
      } catch (_) {}
    }

    final responseJsonString = _getResponse(url, productId: productId);
    final decodedData = jsonDecode(responseJsonString);
    return MockResponse(data: decodedData);
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    final productId =
        (queryParameters?['product_id'] ??
                queryParameters?['productId'] ??
                queryParameters?['id'])
            ?.toString();

    final responseJsonString = _getResponse(url, productId: productId);
    final decodedData = jsonDecode(responseJsonString);
    return MockResponse(data: decodedData);
  }

  String _getResponse(String url, {String? productId}) {
    switch (url) {
      case 'product/list':
        return MockModels.productListResponse;
      case 'product/search':
        return MockModels.productSearchResponse;
      case 'product/data':
        return MockModels.productDataResponse(productId ?? "1");
      default:
        return '{"success": false, "message": "Endpoint Not Found"}';
    }
  }
}

class MockResponse {
  final dynamic data;
  MockResponse({required this.data});
}
