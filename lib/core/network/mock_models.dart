import 'dart:convert';

class MockModels {
  /// Endpoint : product/list
  static const String productListResponse = '''{
    "success": true,
    "message": "Product List Fetched Successfully",
    "output": [
      {
        "id": "1",
        "title": "Aura Wireless Noise-Cancelling Headphones",
        "description": "Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. Immerse yourself in studio-grade sound with adaptive active noise cancellation. ",
        "price": 199.99,
        "category": "Electronics",
        "imageUrl": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
        "rating": 4.8
      },
      {
        "id": "2",
        "title": "Smart Watch Series 7 Pro",
        "description": "Stay connected and track your health metrics with crystal clear AMOLED display.",
        "price": 249.50,
        "category": "Electronics",
        "imageUrl": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
        "rating": 4.9
      },
      {
        "id": "3",
        "title": "Classic Leather Denim Jacket",
        "description": "Timeless style meets modern comfort. Crafted with premium durable denim.",
        "price": 89.99,
        "category": "Fashion",
        "imageUrl": "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500",
        "rating": 4.6
      },
      {
        "id": "4",
        "title": "Minimalist Urban Sneakers",
        "description": "Lightweight breathable sneakers designed for all-day streetwear comfort.",
        "price": 119.00,
        "category": "Fashion",
        "imageUrl": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
        "rating": 4.7
      },
      {
        "id": "5",
        "title": "Nordic Ceramic Coffee Mug Set",
        "description": "Handcrafted minimalist ceramic mugs perfect for your daily coffee brew.",
        "price": 34.99,
        "category": "Home",
        "imageUrl": "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500",
        "rating": 4.5
      },
      {
        "id": "6",
        "title": "Modern Ergonomic Table Lamp",
        "description": "Warm ambient lighting with touch controls and adjustable brightness levels.",
        "price": 59.90,
        "category": "Home",
        "imageUrl": "https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=500",
        "rating": 4.4
      },
      {
        "id": "7",
        "title": "Organic Botanical Face Serum",
        "description": "Nourish your skin with natural essential oils and hydrating botanical extracts.",
        "price": 45.00,
        "category": "Beauty",
        "imageUrl": "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500",
        "rating": 4.8
      },
      {
        "id": "8",
        "title": "Hydrating Rose Water Facial Mist",
        "description": "Instant skin refreshment with pure organic rose water for glowing skin.",
        "price": 22.50,
        "category": "Beauty",
        "imageUrl": "https://images.unsplash.com/photo-1608248597261-83325803d46f?w=500",
        "rating": 4.3
      },
      {
        "id": "9",
        "title": "Non-Slip Eco-Friendly Yoga Mat",
        "description": "Extra thick cushioning mat engineered for optimal grip during intense workouts.",
        "price": 39.99,
        "category": "Sports",
        "imageUrl": "https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500",
        "rating": 4.9
      },
      {
        "id": "10",
        "title": "Pro Insulated Stainless Steel Bottle",
        "description": "Keeps beverages cold for 24 hours and hot for 12 hours. BPA free.",
        "price": 29.99,
        "category": "Sports",
        "imageUrl": "https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=500",
        "rating": 4.7
      },
      {
        "id": "11",
        "title": "The Art of Creative Thinking",
        "description": "Inspiring hardbound guide on unlocking human potential and creative strategy.",
        "price": 18.99,
        "category": "Books",
        "imageUrl": "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500",
        "rating": 4.8
      },
      {
        "id": "12",
        "title": "Vintage Leather Pocket Journal",
        "description": "Handstitched leather notebook filled with thick eco-friendly cream paper.",
        "price": 24.50,
        "category": "Books",
        "imageUrl": "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500",
        "rating": 4.6
      },
      {
        "id": "13",
        "title": "Aura Wireless Noise-Cancelling Headphones",
        "description": "Immerse yourself in studio-grade sound with adaptive active noise cancellation.",
        "price": 199.99,
        "category": "Electronics",
        "imageUrl": "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
        "rating": 4.8
      },
      {
        "id": "14",
        "title": "Smart Watch Series 7 Pro",
        "description": "Stay connected and track your health metrics with crystal clear AMOLED display.",
        "price": 249.50,
        "category": "Electronics",
        "imageUrl": "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
        "rating": 4.9
      },
      {
        "id": "15",
        "title": "Classic Leather Denim Jacket",
        "description": "Timeless style meets modern comfort. Crafted with premium durable denim.",
        "price": 89.99,
        "category": "Fashion",
        "imageUrl": "https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500",
        "rating": 4.6
      },
      {
        "id": "16",
        "title": "Minimalist Urban Sneakers",
        "description": "Lightweight breathable sneakers designed for all-day streetwear comfort.",
        "price": 119.00,
        "category": "Fashion",
        "imageUrl": "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
        "rating": 4.7
      },
      {
        "id": "17",
        "title": "Nordic Ceramic Coffee Mug Set",
        "description": "Handcrafted minimalist ceramic mugs perfect for your daily coffee brew.",
        "price": 34.99,
        "category": "Home",
        "imageUrl": "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500",
        "rating": 4.5
      },
      {
        "id": "18",
        "title": "Modern Ergonomic Table Lamp",
        "description": "Warm ambient lighting with touch controls and adjustable brightness levels.",
        "price": 59.90,
        "category": "Home",
        "imageUrl": "https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=500",
        "rating": 4.4
      },
      {
        "id": "19",
        "title": "Organic Botanical Face Serum",
        "description": "Nourish your skin with natural essential oils and hydrating botanical extracts.",
        "price": 45.00,
        "category": "Beauty",
        "imageUrl": "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500",
        "rating": 4.8
      },
      {
        "id": "20",
        "title": "Hydrating Rose Water Facial Mist",
        "description": "Instant skin refreshment with pure organic rose water for glowing skin.",
        "price": 22.50,
        "category": "Beauty",
        "imageUrl": "https://images.unsplash.com/photo-1608248597261-83325803d46f?w=500",
        "rating": 4.3
      },
      {
        "id": "21",
        "title": "Non-Slip Eco-Friendly Yoga Mat",
        "description": "Extra thick cushioning mat engineered for optimal grip during intense workouts.",
        "price": 39.99,
        "category": "Sports",
        "imageUrl": "https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=500",
        "rating": 4.9
      },
      {
        "id": "22",
        "title": "Pro Insulated Stainless Steel Bottle",
        "description": "Keeps beverages cold for 24 hours and hot for 12 hours. BPA free.",
        "price": 29.99,
        "category": "Sports",
        "imageUrl": "https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=500",
        "rating": 4.7
      },
      {
        "id": "23",
        "title": "The Art of Creative Thinking",
        "description": "Inspiring hardbound guide on unlocking human potential and creative strategy.",
        "price": 18.99,
        "category": "Books",
        "imageUrl": "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500",
        "rating": 4.8
      },
      {
        "id": "24",
        "title": "Vintage Leather Pocket Journal",
        "description": "Handstitched leather notebook filled with thick eco-friendly cream paper.",
        "price": 24.50,
        "category": "Books",
        "imageUrl": "https://images.unsplash.com/photo-1512820790803-83ca734da794?w=500",
        "rating": 4.6
      }
    ]
  }''';

  /// Endpoint : product/search
  static String productSearchResponse(String query, {String? category}) {
    try {
      final Map<String, dynamic> decoded = jsonDecode(productListResponse);
      final List<dynamic> allProducts = decoded['output'] ?? [];
      final q = query.trim().toLowerCase();
      final cat = category?.trim().toLowerCase();

      final List<dynamic> filtered = allProducts.where((item) {
        final title = (item['title'] ?? '').toString().toLowerCase();
        final itemCategory = (item['category'] ?? '').toString().toLowerCase();
        final description = (item['description'] ?? '')
            .toString()
            .toLowerCase();

        final matchesQuery =
            q.isEmpty ||
            title.contains(q) ||
            itemCategory.contains(q) ||
            description.contains(q);
        final matchesCategory =
            cat == null || cat.isEmpty || itemCategory == cat;

        return matchesQuery && matchesCategory;
      }).toList();

      final response = {
        "success": true,
        "message": filtered.isEmpty
            ? "No products matched your search"
            : "Product Search Fetched Successfully",
        "data": filtered,
        "total_results": filtered.length,
      };

      return jsonEncode(response);
    } catch (e) {
      return jsonEncode({
        "success": false,
        "message": "Error searching products: ${e.toString()}",
        "data": [],
        "total_results": 0,
      });
    }
  }

  /// Endpoint : product/data (Dynamic Method)
  static String productDataResponse(String productId) {
    try {
      final Map<String, dynamic> decodedList = jsonDecode(productListResponse);
      final List<dynamic> products = decodedList['output'] ?? [];
      final targetProduct = products.firstWhere(
        (item) => item['id'].toString() == productId.toString(),
        orElse: () =>
            products.first, // Fallback to first product if ID doesn't exist
      );
      final Map<String, dynamic> response = {
        "success": true,
        "message": "Product Details Fetched Successfully",
        "output": {
          "id": targetProduct['id'],
          "title": targetProduct['title'],
          "description": targetProduct['description'],
          "price": targetProduct['price'],
          "category": targetProduct['category'],
          "imageUrl": targetProduct['imageUrl'],
          "rating": targetProduct['rating'],
          "reviewsCount": 128,
          "isAvailable": true,
        },
      };

      return jsonEncode(response);
    } catch (e) {
      return jsonEncode({
        "success": false,
        "message": "Error fetching product details: ${e.toString()}",
        "output": null,
      });
    }
  }
}
