import 'dart:convert';
import 'package:http/http.dart' as http;
import 'food_model.dart';

const String apiKey = 'YWvLXndJpJTXbE5USesZOw==J2Usu1dwvmSNiU7s';

class FoodService {
  static Future<Food?> searchFood(String foodName) async {
    final url = Uri.parse('https://api.api-ninjas.com/v1/nutrition?query=$foodName');
    try {
      final response = await http.get(
        url,
        headers: {'X-Api-Key': apiKey},
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          final product = data[0];
          return Food.fromApi({
            'name': product['name'] ?? foodName,
            'calories': product['calories'] ?? 0,
            'protein': product['protein_g'] ?? 0,
            'carbs': product['carbohydrates_total_g'] ?? 0,
            'fat': product['fat_total_g'] ?? 0,
            'image': '', // API Ninjas does not provide an image
          });
        }
      }
    } catch (e) {
      print('Error searching food: $e');
    }
    return null;
  }
}
