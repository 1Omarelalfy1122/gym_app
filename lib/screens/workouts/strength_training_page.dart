import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class StrengthTrainingPage extends StatefulWidget {
  const StrengthTrainingPage({super.key});

  @override
  State<StrengthTrainingPage> createState() => _StrengthTrainingPageState();
}

class _StrengthTrainingPageState extends State<StrengthTrainingPage> {
  Future<void> _launchUrl(String url) async {
    // Convert YouTube shorts URL to regular YouTube URL
    String finalUrl = url;
    if (url.contains('youtube.com/shorts/')) {
      final videoId = Uri.parse(url).pathSegments.last;
      finalUrl = 'https://www.youtube.com/watch?v=$videoId';
    }

    final Uri uri = Uri.parse(finalUrl);
    try {
      // First try to launch in external app
      bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      // If external app launch fails, try platform default browser
      if (!launched) {
        launched = await launchUrl(uri, mode: LaunchMode.platformDefault);
      }

      // If both attempts fail, try in-app browser
      if (!launched) {
        launched = await launchUrl(uri, mode: LaunchMode.inAppWebView);
      }

      if (!launched) {
        throw Exception('Could not launch \$finalUrl');
      }
    } catch (e) {
      // Show error dialog if URL launch fails
      if (context.mounted) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text(
                  'Error',
                  style: GoogleFonts.karla(fontWeight: FontWeight.bold),
                ),
                content: Text(
                  'Could not open the video. Please check your internet connection and try again.',
                  style: GoogleFonts.karla(),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                      style: GoogleFonts.karla(color: Colors.purple),
                    ),
                  ),
                ],
              ),
        );
      }
    }
  }

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

  Widget _buildMuscleGroupCard(
    BuildContext context,
    String title,
    String imagePath,
    String videoUrl,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => _launchUrl(videoUrl),
        child: _buildGlassContainer(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
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
                Icon(Icons.play_circle_outline, color: Colors.purple, size: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final muscleGroups = [
      {
        'title': 'Chest',
        'image': 'assets/Chest.jpg',
        'url': 'https://youtube.com/shorts/4eNDeml3hfk?si=I-DEQ_NQCd4e7IXM',
        'description': 'Build a stronger chest with effective exercises',
      },
      {
        'title': 'Back',
        'image': 'assets/Back.jpg',
        'url': 'https://youtube.com/shorts/fdyhNhlzb7E?si=5Y_dfSazdFxIO9fM',
        'description': 'Develop a powerful back for better posture',
      },
      {
        'title': 'Legs',
        'image': 'assets/legs.jpg',
        'url': 'https://youtube.com/shorts/ocUNowzxgb0?si=aGMxCMkhHa6jkYRH',
        'description': 'Train your legs for strength and stability',
      },
      {
        'title': 'Biceps',
        'image': 'assets/biceps.jpg',
        'url': 'https://youtube.com/shorts/rZ4Qjx_fc7g?si=ulfpkshTo7UPr1yQ',
        'description': 'Shape and strengthen your biceps',
      },
      {
        'title': 'Triceps',
        'image': 'assets/triceps.jpg',
        'url': 'https://youtube.com/shorts/CqB7IsauyDI?si=7whkS3p3r0bd6BXO',
        'description': 'Define and build your triceps',
      },
      {
        'title': 'Shoulders',
        'image': 'assets/Shoulders.jpg',
        'url': 'https://youtube.com/shorts/xP13bQK9ggo?si=IsD9UlFzaFTDtQF2',
        'description': 'Sculpt strong and broad shoulders',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: Stack(
        children: [
          // Background gradient and effects
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
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          'Strength Training',
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
                // Muscle groups list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: muscleGroups.length,
                    itemBuilder: (context, index) {
                      final group = muscleGroups[index];
                      return _buildMuscleGroupCard(
                        context,
                        group['title'] as String,
                        group['image'] as String,
                        group['url'] as String,
                        group['description'] as String,
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
}
