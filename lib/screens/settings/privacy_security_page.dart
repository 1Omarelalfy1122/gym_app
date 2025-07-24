// Privacy and security page for user data protection
// Handles privacy settings and security options

import 'package:flutter/material.dart';

class PrivacySecurityPage extends StatelessWidget {
  const PrivacySecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy & Security')),
      body: ListView(
        children: [
          _buildPrivacySection(),
          const Divider(),
          _buildSecuritySection(),
          const Divider(),
          _buildDataSection(),
          const Divider(),
          _buildPermissionsSection(),
        ],
      ),
    );
  }

  Widget _buildPrivacySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Privacy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SwitchListTile(
          title: const Text('Profile Visibility'),
          subtitle: const Text('Make profile visible to other users'),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: const Text('Activity Status'),
          subtitle: const Text('Show when you\'re active'),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: const Text('Progress Sharing'),
          subtitle: const Text('Share workout progress with community'),
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildSecuritySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Security',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Change Password'),
          trailing: const Icon(Icons.chevron_right),
        ),
        SwitchListTile(
          title: const Text('Two-Factor Authentication'),
          subtitle: const Text('Add extra security to your account'),
          value: false,
          onChanged: (value) {},
        ),
        ListTile(
          leading: const Icon(Icons.devices),
          title: const Text('Manage Devices'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildDataSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Data & Storage',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.storage),
          title: const Text('Storage Usage'),
          trailing: const Text('1.2 GB'),
        ),
        ListTile(
          leading: const Icon(Icons.download),
          title: const Text('Download Data'),
          subtitle: const Text('Get a copy of your data'),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: const Icon(Icons.delete_outline),
          title: const Text('Delete Account'),
          subtitle: const Text('Permanently delete your account'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildPermissionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'App Permissions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SwitchListTile(
          title: const Text('Camera'),
          subtitle: const Text('Allow access to camera'),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: const Text('Location'),
          subtitle: const Text('Allow access to location'),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: const Text('Notifications'),
          subtitle: const Text('Allow push notifications'),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: const Text('Health Data'),
          subtitle: const Text('Allow access to health data'),
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
