// Progress page showing user's fitness journey
// Displays charts, statistics and achievements

import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgressCard('Weight Progress'),
          const SizedBox(height: 16),
          _buildProgressCard('Workout Statistics'),
          const SizedBox(height: 16),
          _buildProgressCard('Goals Progress'),
        ],
      ),
    );
  }

  Widget _buildProgressCard(String title) {
    return Card(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            '$title Placeholder',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
