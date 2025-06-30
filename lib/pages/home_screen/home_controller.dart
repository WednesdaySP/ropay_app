import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIntake = 500.0.obs;
  final targetIntake = 2000.0.obs;
  final lastIntakeTime = '10:24 AM'.obs; // Updated to current time
  final lastIntakeAmount = 200.0.obs;
  final lastIntakeGlasses = 1.obs;

  void addGoal() {
    final newIntake = currentIntake.value + 250.0; // Adjusted to 250ml per glass
    if (newIntake <= targetIntake.value) {
      currentIntake.value = newIntake;
      lastIntakeTime.value = DateTime.now().toString().split(' ')[1].substring(0, 5);
      lastIntakeAmount.value = 250.0;
      lastIntakeGlasses.value = (250 / 250).toInt(); // 1 glass per 250ml
    }
  }
}