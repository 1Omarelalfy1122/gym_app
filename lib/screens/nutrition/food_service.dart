import 'dart:convert';
import 'package:http/http.dart' as http;
import 'food_model.dart';

const String usdaApiKey = 't3TjAJyTwwCE9vaOo3GahroAXvobRi1fQzWmyhDp';

class FoodService {
  static Future<Food?> searchFood(String foodQuery) async {
    // Parse quantity and unit from the query
    final regex = RegExp(r'^(\d+)(g|ml|kg|l|oz|cup|cups|tbsp|tsp)?\s*(.*) ?$', caseSensitive: false);
    int quantity = 1;
    String unit = '';
    String foodName = foodQuery.trim();
    final match = regex.firstMatch(foodQuery.trim());
    if (match != null) {
      quantity = int.tryParse(match.group(1) ?? '1') ?? 1;
      unit = (match.group(2) ?? '').toLowerCase();
      foodName = match.group(3)?.trim() ?? foodName;
    }
    // For now, only support grams (g) and default to 100g if no unit
    double multiplier = 1.0;
    if (unit == 'g' || unit == '') {
      multiplier = quantity / 100.0;
    } else if (unit == 'kg') {
      multiplier = quantity * 10.0;
    } else if (unit == 'ml' || unit == 'l' || unit == 'oz' || unit == 'cup' || unit == 'cups' || unit == 'tbsp' || unit == 'tsp') {
      // For simplicity, treat these as 1:1 with grams (not accurate, but avoids crash)
      multiplier = quantity / 100.0;
    } else {
      multiplier = quantity / 100.0;
    }
    final url = Uri.parse(
      'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$usdaApiKey&query=$foodName&pageSize=1',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final foods = data['foods'];
        if (foods != null && foods.isNotEmpty) {
          final product = foods[0];
          double getNutrient(String name) {
            final nutrient = (product['foodNutrients'] as List?)?.firstWhere(
              (n) => n['nutrientName']?.toLowerCase() == name.toLowerCase(),
              orElse: () => null,
            );
            return nutrient != null && nutrient['value'] != null
                ? (nutrient['value'] as num).toDouble() * multiplier
                : 0.0;
          }
          return Food.fromApi({
            'name': product['description'] ?? foodName,
            'calories': getNutrient('Energy'),
            'protein': getNutrient('Protein'),
            'carbs': getNutrient('Carbohydrate, by difference'),
            'fat': getNutrient('Total lipid (fat)'),
            'image': '',
          });
        }
      }
    } catch (e) {
      print('Error searching food: $e');
    }
    return null;
  }

  static Future<List<Food>> searchFoods(String foodQuery) async {
    final url = Uri.parse(
      'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$usdaApiKey&query=$foodQuery&pageSize=10',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final foods = data['foods'];
        if (foods != null && foods.isNotEmpty) {
          List<Food> results = [];
          for (final product in foods) {
            double getNutrient(String name) {
              final nutrient = (product['foodNutrients'] as List?)?.firstWhere(
                (n) => n['nutrientName']?.toLowerCase() == name.toLowerCase(),
                orElse: () => null,
              );
              return nutrient != null && nutrient['value'] != null
                  ? (nutrient['value'] as num).toDouble()
                  : 0.0;
            }
            results.add(Food.fromApi({
              'name': product['description'] ?? foodQuery,
              'calories': getNutrient('Energy'),
              'protein': getNutrient('Protein'),
              'carbs': getNutrient('Carbohydrate, by difference'),
              'fat': getNutrient('Total lipid (fat)'),
              'image': '',
            }));
          }
          return results;
        }
      }
    } catch (e) {
      print('Error searching foods: $e');
    }
    return [];
  }
}
