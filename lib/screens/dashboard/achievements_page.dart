// Achievements page displaying user's accomplishments
// Shows badges, milestones, and rewards

import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Achievements')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: 6, // Placeholder count
        itemBuilder: (context, index) {
          return _buildAchievementCard('Achievement ${index + 1}');
        },
      ),
    );
  }

  Widget _buildAchievementCard(String title) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, size: 40),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
