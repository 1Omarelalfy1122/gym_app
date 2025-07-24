import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'strength_training_page.dart';
import 'cardio_page.dart';
import 'abs_page.dart';
import '../../../utils/page_transition.dart';

class WorkoutCategoriesPage extends StatelessWidget {
  const WorkoutCategoriesPage({super.key});

  Widget _buildGlassContainer({required Widget child}) {
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
    return PopScope(
      canPop: true,
      child: Scaffold(
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
            // Decorative circles
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
            // Main content
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom app bar with glass effect
                  _buildGlassContainer(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                          Text(
                            'Workout Categories',
                            style: GoogleFonts.karla(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _buildCategoryCard(
                          context,
                          'Strength Training',
                          'assets/muscles.png', // Using chest image for strength training
                          'Build muscle and strength',
                          () => Navigator.push(
                            context,
                            CustomPageRoute(
                              child: const StrengthTrainingPage(),
                            ),
                          ),
                        ),
                        _buildCategoryCard(
                          context,
                          'Cardio',
                          'assets/cardio.png',
                          'Improve endurance and stamina',
                          () => Navigator.push(
                            context,
                            CustomPageRoute(child: const CardioPage()),
                          ),
                        ),
                        _buildCategoryCard(
                          context,
                          'ABS',
                          'assets/abs.png',
                          'High-intensity abs training',
                          () => Navigator.push(
                            context,
                            CustomPageRoute(child: const AbsPage()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    dynamic iconOrImage, // Accept IconData or String
    String description,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: _buildGlassContainer(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    image:
                        iconOrImage is String
                            ? DecorationImage(
                              image: AssetImage(iconOrImage),
                              fit: BoxFit.cover,
                            )
                            : null,
                  ),
                  child:
                      iconOrImage is IconData
                          ? Icon(iconOrImage, color: Colors.purple, size: 30)
                          : null,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.karla(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: GoogleFonts.karla(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.purple, size: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
