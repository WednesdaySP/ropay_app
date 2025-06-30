import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIntake = 500.0.obs;
  final targetIntake = 2000.0.obs;
  final lastIntakeTime = '10:24 AM'.obs;
  final lastIntakeAmount = 250.0.obs;
  final lastIntakeGlasses = 1.obs;

  // IoT Data from RoPay Device
  final waterPhLevel = 7.2.obs; // Example pH value
  final temperature = 25.0.obs; // Example temperature in °C
  final waterQualityIndex = 85.0.obs; // Example quality index (0-100)
  final filterLife = 75.0.obs; // Example filter life percentage
  final planExpiryDate = '2025-07-15'.obs; // Example expiry date

  void addGoal() {
    final newIntake = currentIntake.value + 250.0;
    if (newIntake <= targetIntake.value) {
      currentIntake.value = newIntake;
      lastIntakeTime.value = DateTime.now().toString().split(' ')[1].substring(0, 5);
      lastIntakeAmount.value = 250.0;
      lastIntakeGlasses.value = (250 / 250).toInt();
    }
  }

  // Simulate IoT data updates (replace with actual device data fetching)
  void updateIoTData() {
    waterPhLevel.value = 7.1 + (DateTime.now().second % 10) / 10; // Simulated fluctuation
    temperature.value = 25.0 + (DateTime.now().minute % 5); // Simulated fluctuation
    waterQualityIndex.value = 85.0 + (DateTime.now().second % 15); // Simulated fluctuation
    filterLife.value = 75.0 - (DateTime.now().minute % 10); // Simulated decrease
    // Plan expiry date remains static for now
  }
}