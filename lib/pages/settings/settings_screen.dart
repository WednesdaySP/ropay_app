import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/settings/settings_controller.dart';
import 'package:ropay_app/widgets/settings_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: black)),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SettingsItem(
            icon: Icons.person_outline,
            title: 'account'.tr,
            onTap: null, // Replace with navigation to account screen
          ),
          SettingsItem(
            icon: Icons.notifications_none,
            title: 'notification'.tr,
            onTap: null, // Replace with navigation to notification settings
          ),
          // SettingsItem(
          //   icon: Icons.display_settings,
          //   title: 'display'.tr,
          //   onTap: null, // Replace with navigation to display settings
          // ),
          // SettingsItem(
          //   icon: Icons.privacy_tip,
          //   title: 'privacy'.tr,
          //   onTap: null, // Replace with navigation to privacy settings
          // ),
          SettingsItem(
            icon: Icons.payment,
            title: 'payment'.tr,
            onTap: null,
          ),
          SettingsItem(
            icon: Icons.language,
            title: 'language'.tr,
            onTap: () {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        Get.put(SettingsController()).openLanguageOptions(context, position);
      },
          ),
          // SettingsItem(
          //   icon: Icons.help_outline,
          //   title: 'help'.tr,
          //   onTap: null, 
          // ),
          SettingsItem(
            icon: Icons.logout,
            title: 'logout'.tr,
            onTap: null,
          ),
        ],
      ),
    );
  }
}
