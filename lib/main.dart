import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/pages/device_selection/device_selection_screen.dart';
import 'package:ropay_app/pages/home_screen/home_screen.dart';
import 'package:ropay_app/pages/login_screen/login_screen.dart';
import 'package:ropay_app/pages/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RoPay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/register',
      getPages: [
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/device-selection', page: () => const DeviceSelectionPage()),
      ],
    );
  }
}