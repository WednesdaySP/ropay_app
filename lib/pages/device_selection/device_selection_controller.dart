import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class DeviceSelectionController extends GetxController {
  final selectedDevice = ''.obs;
  final isSyncing = false.obs;

  void selectDevice(String device) {
    selectedDevice.value = device;
  }

  Future<void> syncDevice() async {
    isSyncing.value = true;
    try {
      // Simulate sync process
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      Get.snackbar(
        'Error',
        'Sync failed: $e',
        backgroundColor: red,
        colorText: white,
      );
    } finally {
      isSyncing.value = false;
    }
  }
}