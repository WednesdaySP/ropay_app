import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class LoginController extends GetxController {
  // Controllers for text fields
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();

  // Reactive variables
  final isLoading = false.obs;
  final mobileError = ''.obs;
  final passwordError = ''.obs;
  final selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  void validateMobile() {
    final mobile = mobileController.text.trim();
    if (mobile.isEmpty) {
      mobileError.value = 'Mobile number is required';
    } else if (!RegExp(r'^\d{10}$').hasMatch(mobile)) {
      mobileError.value = 'Enter a valid 10-digit mobile number';
    } else {
      mobileError.value = '';
    }
  }

  void validatePassword() {
    final password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = 'OTP is required';
    } else if (password.length < 4) {
      passwordError.value = 'OTP must be of 4 characters';
    } else {
      passwordError.value = '';
    }
  }

  Future<bool> login() async {
    validateMobile();
    validatePassword();

    if (mobileError.value.isNotEmpty || passwordError.value.isNotEmpty || selectedRole.value.isEmpty) {
      return false;
    }

    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed: $e',
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
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}