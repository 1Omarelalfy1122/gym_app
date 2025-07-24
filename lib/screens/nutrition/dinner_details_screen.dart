import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/screens/nutrition/meal_details_screen.dart';
import 'dart:ui';
import 'meal_plans_page.dart';

class DinnerDetailsScreen extends StatelessWidget {
  final String mealType;
  final String mealTime;
  final List<Meal> meals;

  const DinnerDetailsScreen({
    super.key,
    required this.mealType,
    required this.mealTime,
    required this.meals,
  });

  static List<Meal> get dinnerMeals => [
    Meal(
      name: 'Grilled Chicken Salad',
      emoji: '🍗',
      ingredients: [
        '120g grilled chicken breast (200 kcal)',
        '2 cups mixed greens (30 kcal)',
        '1 tsp olive oil + lemon dressing (40 kcal)',
        'Cherry tomatoes, cucumber, carrots (30 kcal)',
      ],
      totalCalories: 300,
      tag: 'Weight Loss / Light Dinner',
    ),
    Meal(
      name: 'Tuna & Avocado Lettuce Wraps',
      emoji: '🐟',
      ingredients: [
        '1 can tuna in water (100 kcal)',
        '1/2 avocado (120 kcal)',
        '3–4 large lettuce leaves (10 kcal)',
        'Lime, pepper',
      ],
      totalCalories: 230,
      tag: 'Healthy Fats / Low Carb',
    ),
    Meal(
      name: 'Lentil Soup with Toast',
      emoji: '🍲',
      ingredients: [
        '1 bowl homemade lentil soup (180 kcal)',
        '1 slice whole wheat toast (80 kcal)',
      ],
      totalCalories: 260,
      tag: 'Vegetarian / Balanced',
    ),
    Meal(
      name: 'Grilled Steak with Steamed Veggies',
      emoji: '🥩',
      ingredients: [
        '120g lean beef steak (250 kcal)',
        '1 cup steamed mixed vegetables (50 kcal)',
        '1 tsp olive oil (40 kcal)',
      ],
      totalCalories: 340,
      tag: 'Muscle Gain / Iron-Rich',
    ),
    Meal(
      name: 'Zucchini Noodles with Chicken and Pesto',
      emoji: '🍝',
      ingredients: [
        '100g grilled chicken (165 kcal)',
        '1 cup zucchini noodles (20 kcal)',
        '1 tbsp homemade pesto (80 kcal)',
      ],
      totalCalories: 265,
      tag: 'Low Carb / High Protein',
    ),
    Meal(
      name: 'Egg Omelette with Veggies & Feta',
      emoji: '🍛',
      ingredients: [
        '2 eggs (140 kcal)',
        'Bell pepper, spinach, tomato (30 kcal)',
        '30g feta cheese (80 kcal)',
      ],
      totalCalories: 250,
      tag: 'Keto-Friendly / High Protein',
    ),
    Meal(
      name: 'Baked Chicken with Couscous & Green Beans',
      emoji: '🍚',
      ingredients: [
        '100g baked chicken (170 kcal)',
        '1/2 cup cooked couscous (110 kcal)',
        '1 cup green beans (35 kcal)',
      ],
      totalCalories: 315,
      tag: 'Balanced / Lean Dinner',
    ),
  ];

  @override
  Widget build(BuildContext context) => MealDetailsScreen(
    mealType: mealType,
    mealTime: mealTime,
    meals: meals.isEmpty ? dinnerMeals : meals,
  );
}
