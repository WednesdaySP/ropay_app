import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropay_app/pages/mqtt_example.dart';
import 'package:ropay_app/routes/app_routes.dart';

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
         primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MqttExample(),
      // initialRoute: AppRoutes.splashScreen,
      // getPages: AppRoutes.routes,
    );
  }
}