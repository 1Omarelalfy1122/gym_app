import 'dart:convert';
import 'package:http/http.dart' as http;
import 'food_model.dart';

class FoodService {
  static Future<Food?> searchFood(String foodName) async {
    final url = Uri.parse(
      'https://world.openfoodfacts.org/cgi/search.pl?search_terms=$foodName&search_simple=1&action=process&json=1',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final products = data['products'];

        if (products != null && products.isNotEmpty) {
          final product = products[0];
          return Food.fromApi({
            'name': product['product_name'] ?? foodName,
            'calories': product['nutriments']?['energy-kcal_100g'] ?? 0,
            'protein': product['nutriments']?['proteins_100g'] ?? 0,
            'carbs': product['nutriments']?['carbohydrates_100g'] ?? 0,
            'fat': product['nutriments']?['fat_100g'] ?? 0,
            'image': product['image_front_url'] ?? '',
          });
        }
      }
    } catch (e) {
      print('Error searching food: $e');
    }

    return null;
  }
}
