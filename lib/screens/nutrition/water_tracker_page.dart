// Water tracker page for monitoring daily water intake
// Displays water consumption goals and progress

import 'package:flutter/material.dart';

class WaterTrackerPage extends StatelessWidget {
  const WaterTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Tracker')),
      body: Column(
        children: [
          _buildWaterProgress(),
          const Divider(),
          Expanded(child: _buildWaterLog()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildWaterProgress() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Icon(Icons.water_drop, size: 48, color: Colors.blue),
          const SizedBox(height: 16),
          const Text(
            '1.5 / 2.5L',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text(
            'daily goal',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterLog() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.water_drop, color: Colors.blue),
          title: const Text('250ml'),
          subtitle: Text('${DateTime.now().hour}:${DateTime.now().minute}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
