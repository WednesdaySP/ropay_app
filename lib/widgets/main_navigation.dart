import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/bills/bills_page.dart';
import 'package:ropay_app/pages/home_screen/home_controller.dart';
import 'package:ropay_app/pages/home_screen/home_screen.dart';
import 'package:ropay_app/pages/settings/settings_screen.dart';
import 'package:ropay_app/pages/subscription/subscription_page.dart';

class MainNavigation extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  MainNavigation({super.key});

  final List<Widget> _pages = [
    const HomePage(),
    const BillsPage(),
    const SubscriptionsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: black,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: accentBlue,
            unselectedItemColor: Colors.grey,
            elevation: 2,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'Bills'),
              BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
            onTap: (index) {
              if (index != controller.currentIndex.value) {
                controller.currentIndex.value = index;
              }
            },
          ),
        ));
  }
}