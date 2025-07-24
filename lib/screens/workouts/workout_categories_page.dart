// Workout categories page showing different types of workouts
// Displays categories like Strength, Cardio, Yoga, etc.

import 'package:flutter/material.dart';

class WorkoutCategoriesPage extends StatelessWidget {
  const WorkoutCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Categories')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCategoryCard('Strength Training', Icons.fitness_center),
          _buildCategoryCard('Cardio', Icons.directions_run),
          _buildCategoryCard('Yoga', Icons.self_improvement),
          _buildCategoryCard('HIIT', Icons.timer),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 36),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
