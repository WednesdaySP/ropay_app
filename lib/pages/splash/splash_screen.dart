import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.signInScreen);
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image:  DecorationImage(
            image:AssetImage('assets/images/ropay-splash.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}