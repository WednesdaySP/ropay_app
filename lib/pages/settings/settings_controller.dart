
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // Show language selection popup menu
  Future<void> openLanguageOptions(BuildContext context, Offset position) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: [
        PopupMenuItem(
          value: 'english',
          child: Text('english'.tr),
        ),
        PopupMenuItem(
          value: 'hindi',
          child: Text('hindi'.tr),
        ),
      ],
    );

    if (selected != null) {
      // Update locale based on selection
      if (selected == 'english') {
        Get.updateLocale(const Locale('en', 'IN'));
        //await _saveLocale('en', 'IN');
      } else if (selected == 'hindi') {
        Get.updateLocale(const Locale('hi', 'IN'));
        //await _saveLocale('hi', 'IN');
      }
    }
  }

  // Save locale to SharedPreferences
  // Future<void> _saveLocale(String languageCode, String countryCode) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('languageCode', languageCode);
  //   await prefs.setString('countryCode', countryCode);
  // }

  // Load saved locale
  // Future<Locale> loadLocale() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final languageCode = prefs.getString('languageCode') ?? 'en';
  //   final countryCode = prefs.getString('countryCode') ?? 'IN';
  //   return Locale(languageCode, countryCode);
  // }
}
