import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/nutrition/meal_details_screen.dart';
import 'dart:ui';
import 'meal_plans_page.dart';

class SnacksDetailsScreen extends StatelessWidget {
  final String mealType;
  final String mealTime;
  final List<Meal> meals;

  const SnacksDetailsScreen({
    super.key,
    required this.mealType,
    required this.mealTime,
    required this.meals,
  });

  static List<Meal> get snackMeals => [
    Meal(
      name: 'Mixed Nuts',
      emoji: '🥜',
      ingredients: [
        '15g almonds + 15g walnuts (≈ 200 kcal)',
      ],
      totalCalories: 200,
      tag: 'Healthy Fats / Energy Boost',
    ),
    Meal(
      name: 'Apple with Peanut Butter',
      emoji: '🍎',
      ingredients: [
        '1 medium apple (95 kcal)',
        '1 tbsp natural peanut butter (90 kcal)',
      ],
      totalCalories: 185,
      tag: 'Pre-workout / Balanced Snack',
    ),
    Meal(
      name: 'Protein Shake (Light)',
      emoji: '🧃',
      ingredients: [
        '1/2 scoop whey protein (60 kcal)',
        '1 cup almond milk (30 kcal)',
        'Ice, cinnamon (optional)',
      ],
      totalCalories: 90,
      tag: 'Low-Cal / Recovery',
    ),
    Meal(
      name: 'Protein Bar',
      emoji: '🍫',
      ingredients: [
        '1 protein bar (typical) (180–250 kcal)',
      ],
      totalCalories: 220,
      tag: 'Post-workout / On-the-go',
    ),
    Meal(
      name: 'Boiled Egg with Cucumber Sticks',
      emoji: '🍳',
      ingredients: [
        '1 boiled egg (70 kcal)',
        '1 cup sliced cucumbers (16 kcal)',
      ],
      totalCalories: 86,
      tag: 'High Protein / Light',
    ),
    Meal(
      name: 'Banana + Handful of Oats',
      emoji: '🍌',
      ingredients: [
        '1 medium banana (100 kcal)',
        '1 tbsp dry oats or granola (50 kcal)',
      ],
      totalCalories: 150,
      tag: 'Energy Boost / Quick Carb',
    ),
    Meal(
      name: 'Greek Yogurt Cup (Low-Fat)',
      emoji: '🥛',
      ingredients: [
        '100g low-fat Greek yogurt (60–80 kcal)',
      ],
      totalCalories: 80,
      tag: 'Light Protein Snack',
    ),
  ];

  @override
  Widget build(BuildContext context) => MealDetailsScreen(
    mealType: mealType,
    mealTime: mealTime,
    meals: meals.isEmpty ? snackMeals : meals,
  );
}
