class Food {
  final String name;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final String imageUrl;

  Food({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.imageUrl,
  });

  factory Food.fromApi(Map<String, dynamic> data) {
    double parseDouble(dynamic value) {
      if (value is num) return value.toDouble();
      if (value is String) {
        final v = double.tryParse(value);
        if (v != null) return v;
      }
      return 0.0;
    }
    return Food(
      name: data['name'] ?? '',
      calories: parseDouble(data['calories']),
      protein: parseDouble(data['protein']),
      carbs: parseDouble(data['carbs']),
      fat: parseDouble(data['fat']),
      imageUrl: data['image'] ?? '',
    );
  }
}
