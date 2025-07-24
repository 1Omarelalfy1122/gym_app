// Meal plans page showing different meal options
// Displays daily and weekly meal plans

import 'package:flutter/material.dart';

class MealPlansPage extends StatelessWidget {
  const MealPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Plans')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMealPlanCard('Breakfast', '7:00 AM'),
          _buildMealPlanCard('Lunch', '12:30 PM'),
          _buildMealPlanCard('Snack', '4:00 PM'),
          _buildMealPlanCard('Dinner', '7:30 PM'),
        ],
      ),
    );
  }

  Widget _buildMealPlanCard(String mealType, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(time, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Meal plan details placeholder'),
          ],
        ),
      ),
    );
  }
}
