import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'meal_plans_page.dart';

class LunchDetailsScreen extends StatelessWidget {
  final String mealType;
  final String mealTime;
  final List<Meal> meals;

  const LunchDetailsScreen({
    super.key,
    required this.mealType,
    required this.mealTime,
    required this.meals,
  });

  static List<Meal> get lunchMeals => [
    Meal(
      name: 'Grilled Chicken with Brown Rice and Veggies',
      emoji: '🍗',
      ingredients: [
        '150g grilled chicken breast (250 kcal)',
        '1/2 cup cooked brown rice (110 kcal)',
        '1 cup steamed broccoli + carrots (50 kcal)',
        '1 tsp olive oil (40 kcal)',
      ],
      totalCalories: 450,
      tag: 'Muscle Gain / Weight Loss',
    ),
    Meal(
      name: 'Beef Stir-Fry with Vegetables and Quinoa',
      emoji: '🥩',
      ingredients: [
        '100g lean beef strips (210 kcal)',
        '1/2 cup cooked quinoa (110 kcal)',
        '1 cup stir-fried bell peppers & zucchini (60 kcal)',
        '1 tsp sesame oil (45 kcal)',
      ],
      totalCalories: 425,
      tag: 'Muscle Gain / Energy Boost',
    ),
    Meal(
      name: 'Baked Salmon with Sweet Potato and Green Beans',
      emoji: '🐟',
      ingredients: [
        '120g salmon fillet (230 kcal)',
        '1 medium sweet potato (100 kcal)',
        '1 cup steamed green beans (35 kcal)',
        '1 tsp olive oil or lemon dressing (40 kcal)',
      ],
      totalCalories: 405,
      tag: 'Muscle Gain / Healthy Fats',
    ),
    Meal(
      name: 'Chicken Shawarma Wrap (Healthy Version)',
      emoji: '🥙',
      ingredients: [
        '100g grilled chicken seasoned (180 kcal)',
        '1 whole wheat wrap (130 kcal)',
        'Garlic yogurt sauce (light, 50 kcal)',
        'Lettuce, tomato, onion (30 kcal)',
      ],
      totalCalories: 390,
      tag: 'Weight Loss / Balanced Meal',
    ),
    Meal(
      name: 'Tuna Salad with Olive Oil Dressing',
      emoji: '🥗',
      ingredients: [
        '1 can tuna in water, drained (100 kcal)',
        'Mixed greens (lettuce, cucumber, tomato) (40 kcal)',
        '1 boiled egg (70 kcal)',
        '1 tsp olive oil + vinegar (40 kcal)',
      ],
      totalCalories: 250,
      tag: 'Weight Loss / Light Lunch',
    ),
    Meal(
      name: 'Whole Wheat Pasta with Chicken and Spinach',
      emoji: '🍝',
      ingredients: [
        '1 cup cooked whole wheat pasta (180 kcal)',
        '100g grilled chicken (165 kcal)',
        '1/2 cup sautéed spinach (30 kcal)',
        'Tomato-based sauce (50 kcal)',
      ],
      totalCalories: 425,
      tag: 'Muscle Gain / Carbs Focused',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mealType,
                            style: GoogleFonts.karla(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            mealTime,
                            style: GoogleFonts.karla(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: lunchMeals.length,
                    itemBuilder: (context, index) {
                      final meal = lunchMeals[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildMealCard(meal),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(Meal meal) {
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
          child: ExpansionTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                meal.emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            title: Text(
              meal.name,
              style: GoogleFonts.karla(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${meal.totalCalories} calories',
                  style: GoogleFonts.karla(
                    color: Colors.purple[300],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    meal.tag,
                    style: GoogleFonts.karla(
                      color: Colors.purple[100],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white.withOpacity(0.6),
            ),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingredients:',
                      style: GoogleFonts.karla(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...meal.ingredients.map(
                      (ingredient) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 8,
                              color: Colors.purple[300],
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                ingredient,
                                style: GoogleFonts.karla(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
