import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills', style: TextStyle(color: black)),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
         leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.lightBlue[100]!, accentBlue],
        //   ),
        // ),
        child: const Center(
          child: Text('Bills Page', style: TextStyle(fontSize: 24, color: primaryBlue)),
        ),
      ),
    );
  }
}