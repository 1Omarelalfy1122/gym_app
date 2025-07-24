// Trainer profile page showing detailed trainer information
// Displays trainer bio, specializations, reviews, and booking options

import 'package:flutter/material.dart';

class TrainerProfilePage extends StatelessWidget {
  const TrainerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTrainerInfo(),
                const Divider(),
                _buildSpecializations(),
                const Divider(),
                _buildAvailability(),
                const Divider(),
                _buildReviews(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Trainer Name'),
        background: Container(
          color: Colors.grey[300],
          child: const Center(child: Icon(Icons.person, size: 80)),
        ),
      ),
    );
  }

  Widget _buildTrainerInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Experience: 5 years', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text('4.8 (124 reviews)'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'About',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Trainer bio placeholder text. This will contain information about the trainer\'s background, philosophy, and approach to fitness.',
          ),
        ],
      ),
    );
  }

  Widget _buildSpecializations() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Specializations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                [
                  'Strength Training',
                  'HIIT',
                  'Weight Loss',
                  'Nutrition',
                ].map((spec) => Chip(label: Text(spec))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailability() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Availability',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Availability calendar placeholder'),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reviews',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Reviews list placeholder'),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Book Session'),
      ),
    );
  }
}
