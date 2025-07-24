// Meal plans page showing different meal options
// Displays daily and weekly meal plans

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'meal_details_screen.dart';
import 'lunch_details_screen.dart';
import 'snacks_details_screen.dart';
import 'dinner_details_screen.dart';

class Meal {
  final String name;
  final String emoji;
  final List<String> ingredients;
  final int totalCalories;
  final String tag;

  Meal({
    required this.name,
    required this.emoji,
    required this.ingredients,
    required this.totalCalories,
    required this.tag,
  });
}

class MealPlansPage extends StatelessWidget {
  const MealPlansPage({super.key});

  Widget _buildGlassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }

  List<Meal> get breakfastMeals => [
    Meal(
      name: 'Oatmeal with Banana and Peanut Butter',
      emoji: '🥣',
      ingredients: [
        '1/2 cup oats (150 kcal)',
        '1/2 banana sliced (50 kcal)',
        '1 tbsp natural peanut butter (90 kcal)',
        '1 cup water or low-fat milk (80 kcal)',
      ],
      totalCalories: 370,
      tag: 'Energy Boost / Muscle Gain',
    ),
    Meal(
      name: 'Scrambled Eggs with Whole Grain Toast',
      emoji: '🍳',
      ingredients: [
        '2 eggs (140 kcal)',
        '1 tsp olive oil or butter (40 kcal)',
        '1 slice whole grain bread (80 kcal)',
        'Optional: cherry tomatoes/spinach (20 kcal)',
      ],
      totalCalories: 280,
      tag: 'Protein Rich / Weight Loss',
    ),
    Meal(
      name: 'Protein Smoothie',
      emoji: '🥤',
      ingredients: [
        '1 scoop whey protein (120 kcal)',
        '1 banana (100 kcal)',
        '1 tbsp peanut butter (90 kcal)',
        '1/2 cup oats (150 kcal)',
        'Water or almond milk (30 kcal)',
      ],
      totalCalories: 490,
      tag: 'Muscle Gain / Pre-Workout',
    ),
    Meal(
      name: 'Greek Yogurt Parfait',
      emoji: '🥞',
      ingredients: [
        '1 cup Greek yogurt (130 kcal)',
        '1/4 cup granola (120 kcal)',
        '1/2 cup mixed berries (40 kcal)',
        'Drizzle of honey (30 kcal)',
      ],
      totalCalories: 320,
      tag: 'Balanced / Weight Loss',
    ),
    Meal(
      name: 'Avocado Toast with Egg',
      emoji: '🥑',
      ingredients: [
        '1 slice whole grain toast (80 kcal)',
        '1/2 avocado (120 kcal)',
        '1 boiled or poached egg (70 kcal)',
      ],
      totalCalories: 270,
      tag: 'Healthy Fats / Weight Loss',
    ),
    Meal(
      name: 'Cottage Cheese with Fruit and Nuts',
      emoji: '🧀',
      ingredients: [
        '1/2 cup cottage cheese (100 kcal)',
        '1/2 apple chopped (40 kcal)',
        '1 tbsp walnuts (45 kcal)',
      ],
      totalCalories: 185,
      tag: 'Light / Weight Loss',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background effects
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2C3E50), Color(0xFF1A1A1A)],
              ),
            ),
          ),
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.purple.withOpacity(0.3),
                    Colors.purple.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.blue.withOpacity(0.3),
                    Colors.blue.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Meal Plans',
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildMealTimeCard(
                      context,
                      'Breakfast',
                      '7:00 AM',
                      Icons.breakfast_dining,
                      breakfastMeals,
                    ),
                    const SizedBox(height: 16),
                    _buildMealTimeCard(
                      context,
                      'Lunch',
                      '12:30 PM',
                      Icons.lunch_dining,
                      LunchDetailsScreen.lunchMeals,
                    ),
                    const SizedBox(height: 16),
                    _buildMealTimeCard(
                      context,
                      'Snack',
                      '4:00 PM',
                      Icons.cookie,
                      SnacksDetailsScreen.snackMeals,
                    ),
                    const SizedBox(height: 16),
                    _buildMealTimeCard(
                      context,
                      'Dinner',
                      '7:30 PM',
                      Icons.dinner_dining,
                      DinnerDetailsScreen.dinnerMeals,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],),
    );
  }

  Widget _buildMealTimeCard(
    BuildContext context,
    String mealType,
    String time,
    IconData icon,
    List<Meal> meals,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailsScreen(
              mealType: mealType,
              mealTime: time,
              meals: meals,
            ),
          ),
        );
      },
      child: _buildGlassCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: Colors.purple[300],
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealType,
                      style: GoogleFonts.karla(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.white60,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: GoogleFonts.karla(
                            color: Colors.white60,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (meals.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${meals.length} meals',
                              style: GoogleFonts.karla(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        if (meals.isEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Coming soon',
                              style: GoogleFonts.karla(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white60,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
