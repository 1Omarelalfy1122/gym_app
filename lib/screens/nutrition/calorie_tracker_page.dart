// Calorie tracker page for monitoring daily intake
// Displays calorie goals, consumption, and remaining calories

import 'package:flutter/material.dart';

class CalorieTrackerPage extends StatelessWidget {
  const CalorieTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calorie Tracker')),
      body: Column(
        children: [
          _buildCalorieOverview(),
          const Divider(),
          Expanded(child: _buildMealsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCalorieOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            '1,200 / 2,000',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text(
            'calories remaining',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNutrientProgress('Carbs', 0.7),
              _buildNutrientProgress('Protein', 0.5),
              _buildNutrientProgress('Fat', 0.3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientProgress(String label, double progress) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
        CircularProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
        ),
      ],
    );
  }

  Widget _buildMealsList() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.restaurant),
          title: Text('Meal ${index + 1}'),
          subtitle: const Text('Calories: 500'),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }
}
