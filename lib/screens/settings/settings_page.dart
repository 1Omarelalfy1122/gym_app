// Settings page for app configuration
// Handles app settings and user preferences

import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _workoutReminders = true;
  bool _communityUpdates = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
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
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  _buildProfileSection(context),
                  const Divider(color: Colors.white24),
                  _buildPreferencesSection(),
                  const Divider(color: Colors.white24),
                  _buildNotificationsSection(),
                  const Divider(color: Colors.white24),
                  _buildPrivacySection(),
                  const Divider(color: Colors.white24),
                  _buildSupportSection(),
                  const Divider(color: Colors.white24),
                  _buildAboutSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: const Text('John Doe', style: TextStyle(color: Colors.white)),
      subtitle: const Text('View and edit profile', style: TextStyle(color: Colors.white70)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const EditProfilePage()),
        );
      },
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Preferences',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.language, color: Colors.white),
          title: const Text('Language', style: TextStyle(color: Colors.white)),
          trailing: const Text('English', style: TextStyle(color: Colors.white70)),
        ),
        ListTile(
          leading: const Icon(Icons.notifications, color: Colors.white),
          title: const Text('Notifications', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Notifications',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SwitchListTile(
          title: const Text('Workout Reminders', style: TextStyle(color: Colors.white)),
          subtitle: const Text('Daily workout notifications', style: TextStyle(color: Colors.white70)),
          value: _workoutReminders,
          onChanged: (value) {
            setState(() {
              _workoutReminders = value;
            });
          },
          activeColor: Colors.purple,
        ),
        SwitchListTile(
          title: const Text('Community Updates', style: TextStyle(color: Colors.white)),
          subtitle: const Text('New posts and messages', style: TextStyle(color: Colors.white70)),
          value: _communityUpdates,
          onChanged: (value) {
            setState(() {
              _communityUpdates = value;
            });
          },
          activeColor: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildPrivacySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Privacy & Security',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.lock, color: Colors.white),
          title: const Text('Privacy Settings', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
        ListTile(
          leading: const Icon(Icons.security, color: Colors.white),
          title: const Text('Security', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.help_outline, color: Colors.white),
          title: const Text('Help Center', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
        ListTile(
          leading: const Icon(Icons.contact_support, color: Colors.white),
          title: const Text('Contact Support', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'About',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline, color: Colors.white),
          title: const Text('About App', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
        ListTile(
          leading: const Icon(Icons.description, color: Colors.white),
          title: const Text('Terms of Service', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
        ListTile(
          leading: const Icon(Icons.privacy_tip, color: Colors.white),
          title: const Text('Privacy Policy', style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.white),
        ),
      ],
    );
  }
}

