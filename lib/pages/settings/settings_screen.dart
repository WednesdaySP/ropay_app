import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/widgets/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: black),
          onPressed: () => Get.back(),
        ),
        title: const Text('Settings', style: TextStyle(color: black)),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.lightBlue[100]!, accentBlue],
        //   ),
        // ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            SettingsItem(
              icon: Icons.person_outline,
              title: 'Account',
              onTap: null, // Replace with navigation to account screen
            ),
            SettingsItem(
              icon: Icons.notifications_none,
              title: 'Notification',
              onTap: null, // Replace with navigation to notification settings
            ),
            SettingsItem(
              icon: Icons.display_settings,
              title: 'Display',
              onTap: null, // Replace with navigation to display settings
            ),
            SettingsItem(
              icon: Icons.privacy_tip,
              title: 'Privacy',
              onTap: null, // Replace with navigation to privacy settings
            ),
            SettingsItem(
              icon: Icons.payment,
              title: 'Payment',
              onTap: null,
            ),
            SettingsItem(
              icon: Icons.language,
              title: 'Language',
              onTap: null, 
            ),
            SettingsItem(
              icon: Icons.help_outline,
              title: 'Help',
              onTap: null, 
            ),
            SettingsItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
