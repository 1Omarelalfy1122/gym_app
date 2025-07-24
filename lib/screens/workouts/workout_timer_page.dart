// Workout timer page for tracking workout progress
// Displays current exercise, timer, and controls

import 'package:flutter/material.dart';

class WorkoutTimerPage extends StatefulWidget {
  const WorkoutTimerPage({super.key});

  @override
  State<WorkoutTimerPage> createState() => _WorkoutTimerPageState();
}

class _WorkoutTimerPageState extends State<WorkoutTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Timer')),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Center(
              child: Text(
                '00:45',
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Current Exercise',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Push-ups',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: () {},
                        iconSize: 48,
                      ),
                      IconButton(
                        icon: const Icon(Icons.pause_circle_filled),
                        onPressed: () {},
                        iconSize: 64,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: () {},
                        iconSize: 48,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
