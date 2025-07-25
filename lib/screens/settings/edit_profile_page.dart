// Edit profile page for user profile management
// Handles user profile information updates

import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Save logic here (could be extended to actually persist data)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile changes saved!', style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.purple,
                  ),
                );
              }
            },
            child: const Text('Save', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildBackgroundEffects(),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16),
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white.withOpacity(0.08),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(color: Colors.white.withOpacity(0.15)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildProfileImage(),
                      const SizedBox(height: 32),
                      _buildProfileForm(),
                      const SizedBox(height: 32),
                      _buildPreferencesForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundEffects() {
    return Stack(
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
      ],
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.purple,
            child: const Icon(Icons.person, size: 60, color: Colors.white),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              child: IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Full Name',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Date of Birth',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildPreferencesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fitness Preferences',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF2C3E50),
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Fitness Level',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
          items: const [
            DropdownMenuItem(value: 'beginner', child: Text('Beginner', style: TextStyle(color: Colors.white))),
            DropdownMenuItem(
              value: 'intermediate',
              child: Text('Intermediate', style: TextStyle(color: Colors.white)),
            ),
            DropdownMenuItem(value: 'advanced', child: Text('Advanced', style: TextStyle(color: Colors.white))),
          ],
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Weight (kg)',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Height (cm)',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Fitness Goals',
            labelStyle: TextStyle(color: Colors.white70),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
            hintText: 'e.g., Weight loss, Muscle gain, etc.',
            hintStyle: TextStyle(color: Colors.white38),
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
