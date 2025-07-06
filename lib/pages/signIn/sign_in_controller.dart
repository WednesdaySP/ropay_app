import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class SignInController extends GetxController {

  // Reactive variables
  final isLoading = false.obs;
  final selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }


  Future<bool> login() async {

    if ( selectedRole.value.isEmpty) {
      return false;
    }

    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Selection failed: $e',
        backgroundColor: red,
        colorText: white,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}