import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'trainer_model.dart';
import 'trainer_details_screen.dart';

class TrainersPage extends StatelessWidget {
  const TrainersPage({super.key});

  List<Trainer> get trainers => [
    Trainer(
      name: "Alex Parker",
      specialization: "Strength & Conditioning",
      imageUrl: "assets/trainer1.jpg",
      experience: "8+ years",
      certifications: [
        "NASM Certified Personal Trainer",
        "CrossFit Level 2 Trainer",
        "Sports Nutrition Specialist",
      ],
      rating: "4.9",
      bio: "Passionate about helping clients achieve their strength and fitness goals. Specializes in powerlifting and functional training.",
      availability: ["Mon-Fri: 6AM-2PM", "Sat: 8AM-12PM"],
      expertise: [
        "Strength Training",
        "Powerlifting",
        "HIIT",
        "Nutrition Planning",
      ],
    ),
    Trainer(
      name: "Sarah Martinez",
      specialization: "Yoga & Flexibility",
      imageUrl: "assets/trainer2.jpg",
      experience: "6+ years",
      certifications: [
        "RYT-500 Yoga Instructor",
        "Pilates Certified",
        "Meditation Coach",
      ],
      rating: "4.8",
      bio: "Dedicated to helping people find balance through yoga and mindful movement. Expert in flexibility and stress reduction techniques.",
      availability: ["Mon-Thu: 9AM-5PM", "Sun: 10AM-2PM"],
      expertise: [
        "Vinyasa Yoga",
        "Flexibility Training",
        "Meditation",
        "Stress Management",
      ],
    ),
    Trainer(
      name: "Mike Johnson",
      specialization: "Weight Loss Expert",
      imageUrl: "assets/trainer3.jpg",
      experience: "10+ years",
      certifications: [
        "ACE Certified Personal Trainer",
        "Weight Management Specialist",
        "Behavioral Change Specialist",
      ],
      rating: "4.9",
      bio: "Committed to transforming lives through sustainable weight loss programs and lifestyle changes.",
      availability: ["Mon-Fri: 7AM-3PM", "Sat: 9AM-1PM"],
      expertise: [
        "Weight Loss",
        "Nutrition Coaching",
        "Cardio Training",
        "Lifestyle Transformation",
      ],
    ),
    Trainer(
      name: "Emma Wilson",
      specialization: "Sports Performance",
      imageUrl: "assets/trainer4.jpg",
      experience: "7+ years",
      certifications: [
        "CSCS Certified",
        "Sports Performance Specialist",
        "Athletic Training Certified",
      ],
      rating: "4.7",
      bio: "Former athlete turned trainer, specializing in sports-specific training and athletic performance enhancement.",
      availability: ["Mon-Fri: 2PM-8PM", "Sat: 10AM-4PM"],
      expertise: [
        "Sports Training",
        "Athletic Performance",
        "Speed & Agility",
        "Injury Prevention",
      ],
    ),
  ];

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
          // Blue glow
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
          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Expert Trainers',
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: trainers.length,
                    itemBuilder: (context, index) {
                      final trainer = trainers[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrainerDetailsScreen(
                                  trainer: trainer,
                                ),
                              ),
                            );
                          },
                          child: _buildGlassCard(
                            child: Container(
                              height: 120,
                              child: Row(
                                children: [
                                  // Trainer Image
                                  Container(
                                    width: 100,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(trainer.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // Trainer Info
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            trainer.name,
                                            style: GoogleFonts.karla(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            trainer.specialization,
                                            style: GoogleFonts.karla(
                                              color: Colors.purple[300],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                trainer.rating,
                                                style: GoogleFonts.karla(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.white70,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                trainer.experience,
                                                style: GoogleFonts.karla(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Arrow icon
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white60,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
