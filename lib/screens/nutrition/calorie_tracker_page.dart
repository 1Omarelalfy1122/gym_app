import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'food_service.dart';
import 'food_model.dart';

class CalorieTrackerPage extends StatefulWidget {
  const CalorieTrackerPage({super.key});

  @override
  State<CalorieTrackerPage> createState() => _CalorieTrackerPageState();
}

class _CalorieTrackerPageState extends State<CalorieTrackerPage> {
  final TextEditingController _searchController = TextEditingController();
  Food? _searchResult;
  List<Food> _searchResults = [];
  bool _isLoading = false;
  List<Food> _meals = [];
  String? _searchError;
  int _customGrams = 100;
  
  Future<void> _searchFood() async {
    if (_searchController.text.isEmpty) return;
    setState(() {
      _customGrams = 100;
      _isLoading = true;
      _searchResult = null;
      _searchResults = [];
      _searchError = null;
    });
    try {
      final foods = await FoodService.searchFoods(_searchController.text); // new method
      setState(() {
        _searchResults = foods;
        _isLoading = false;
        if (foods.isEmpty) {
          _searchError = 'No results found for "${_searchController.text}".';
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _searchError = 'Error searching for food.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e', style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _addMeal() {
    if (_searchResult != null) {
      setState(() {
        _meals.add(_searchResult!);
        _searchResult = null;
        _searchController.clear();
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2C3E50), Color(0xFF1A1A1A)],
              ),
            ),
          ),
          // Purple glow
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
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Calorie Tracker',
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildSearchBar(),
                if (_searchError != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _searchError!,
                      style: const TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                  ),
                if (_searchResult != null)
                  _buildSearchResult()
                else if (_searchResults.isNotEmpty)
                  Expanded(child: _buildSearchResultsList()),
                if (_searchResult == null)
                  _buildCalorieOverview(),
                if (_searchResult == null)
                  Expanded(child: _buildMealsList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildGlassCard(
        child: TextField(
          controller: _searchController,
          style: GoogleFonts.karla(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search for food...',
            hintStyle: GoogleFonts.karla(color: Colors.white60),
            prefixIcon: const Icon(Icons.search, color: Colors.white60),
            suffixIcon: _isLoading
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white60),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white60),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchResult = null;
                        _searchError = null;
                      });
                    },
                  ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onSubmitted: (_) => _searchFood(),
        ),
      ),
    );
  }

  Widget _buildSearchResult() {
    // Per-100g values from API
    final per100g = _searchResult!;
    // Calculate for custom grams
    double factor = _customGrams / 100.0;
    double calories = per100g.calories * factor;
    double protein = per100g.protein * factor;
    double carbs = per100g.carbs * factor;
    double fat = per100g.fat * factor;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: _buildGlassCard(
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: per100g.imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        per100g.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.fastfood, size: 40, color: Colors.white60),
                      ),
                    )
                  : const Icon(Icons.fastfood, size: 40, color: Colors.white60),
              title: Text(
                per100g.name,
                style: GoogleFonts.karla(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Grams: ', style: TextStyle(color: Colors.white70)),
                      SizedBox(
                        width: 60,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white24),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                          controller: TextEditingController(text: _customGrams.toString()),
                          onChanged: (val) {
                            final g = int.tryParse(val);
                            if (g != null && g > 0 && g <= 2000) {
                              setState(() => _customGrams = g);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('g', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${calories.toStringAsFixed(0)} kcal per $_customGrams g',
                    style: GoogleFonts.karla(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${protein.toStringAsFixed(1)}g protein - ${carbs.toStringAsFixed(1)}g carbs - ${fat.toStringAsFixed(1)}g fat',
                    style: GoogleFonts.karla(color: Colors.white60),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.purple),
                onPressed: () {
                  // Add meal with custom grams
                  final customMeal = Food(
                    name: '${_customGrams}g ${per100g.name}',
                    calories: calories,
                    protein: protein,
                    carbs: carbs,
                    fat: fat,
                    imageUrl: per100g.imageUrl,
                  );
                  setState(() {
                    _meals.add(customMeal);
                    _searchResult = null;
                    _searchController.clear();
                    _customGrams = 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieOverview() {
    double totalCalories = _meals.fold(0, (sum, meal) => sum + meal.calories);
    double totalCarbs = _meals.fold(0, (sum, meal) => sum + meal.carbs);
    double totalProtein = _meals.fold(0, (sum, meal) => sum + meal.protein);
    double totalFat = _meals.fold(0, (sum, meal) => sum + meal.fat);

    const double dailyCalorieGoal = 2000;
    const double dailyCarbsGoal = 250;
    const double dailyProteinGoal = 150;
    const double dailyFatGoal = 65;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: _buildGlassCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                '${totalCalories.toStringAsFixed(0)} / ${dailyCalorieGoal.toStringAsFixed(0)}',
                style: GoogleFonts.karla(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'calories remaining',
                style: GoogleFonts.karla(
                  color: Colors.white60,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: totalCalories / dailyCalorieGoal,
                backgroundColor: Colors.white10,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNutrientProgress(
                    'Carbs',
                    totalCarbs / dailyCarbsGoal,
                    '${totalCarbs.toStringAsFixed(0)}g',
                  ),
                  _buildNutrientProgress(
                    'Protein',
                    totalProtein / dailyProteinGoal,
                    '${totalProtein.toStringAsFixed(0)}g',
                  ),
                  _buildNutrientProgress(
                    'Fat',
                    totalFat / dailyFatGoal,
                    '${totalFat.toStringAsFixed(0)}g',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientProgress(String label, double progress, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.karla(color: Colors.white60),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress.clamp(0, 1),
              backgroundColor: Colors.white10,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            Text(
              value,
              style: GoogleFonts.karla(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMealsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _meals.length,
      itemBuilder: (context, index) {
        final meal = _meals[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _buildGlassCard(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: meal.imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        meal.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.fastfood, color: Colors.white60),
                      ),
                    )
                  : const Icon(Icons.fastfood, color: Colors.white60),
              title: Text(
                meal.name,
                style: GoogleFonts.karla(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${meal.calories.toStringAsFixed(0)} kcal - ${meal.protein.toStringAsFixed(1)}g protein - ${meal.carbs.toStringAsFixed(1)}g carbs - ${meal.fat.toStringAsFixed(1)}g fat',
                style: GoogleFonts.karla(color: Colors.white60),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _meals.removeAt(index);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchResultsList() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final food = _searchResults[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: _buildGlassCard(
            child: ListTile(
              leading: const Icon(Icons.fastfood, color: Colors.white60),
              title: Text(
                food.name,
                style: GoogleFonts.karla(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${food.calories.toStringAsFixed(0)} kcal, ${food.protein.toStringAsFixed(1)}g protein, ${food.carbs.toStringAsFixed(1)}g carbs, ${food.fat.toStringAsFixed(1)}g fat (per 100g)',
                style: GoogleFonts.karla(color: Colors.white60),
              ),
              onTap: () {
                setState(() {
                  _searchResult = food;
                  _searchResults = [];
                  _customGrams = 100;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
