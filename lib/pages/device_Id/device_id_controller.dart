import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class DeviceIdController extends GetxController {
  final deviceIdController = TextEditingController();
  final deviceIdError = ''.obs;

  void validateDeviceId() {
    final id = deviceIdController.text.trim();
    if (id.isEmpty) {
      deviceIdError.value = 'Device ID is required';
    } else if (id.length != 6) {
      deviceIdError.value = 'Device ID must be exactly 6 characters';
    } else {
      deviceIdError.value = '';
    }
  }

  Future<void> syncDevice() async {
    if (deviceIdError.value.isEmpty && deviceIdController.text.length == 6) {
      try {
        await Future.delayed(const Duration(seconds: 1));
        Get.snackbar(
          'Success',
          'Device synced with ID: ${deviceIdController.text}',
          backgroundColor: Colors.green,
          colorText: white,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Sync failed: $e',
          backgroundColor: red,
          colorText: white,
        );
      }
    }
  }

  @override
  void onClose() {
    deviceIdController.dispose();
    super.onClose();
  }
}