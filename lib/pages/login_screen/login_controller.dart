import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class LoginController extends GetxController {
  // Controllers for text fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive variables
  final isLoading = false.obs;
  final usernameError = ''.obs;
  final passwordError = ''.obs;

  // Validate username field
  void validateUsername() {
    final username = usernameController.text.trim();
    if (username.isEmpty) {
      usernameError.value = 'Username is required';
    } else if (username.length < 3) {
      usernameError.value = 'Username must be at least 3 characters';
    } else {
      usernameError.value = '';
    }
  }

  // Validate password field
  void validatePassword() {
    final password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = 'Password is required';
    } else if (password.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  // Handle login process
  Future<bool> login() async {
    // Validate all fields before proceeding
    validateUsername();
    validatePassword();

    // Check if there are any validation errors
    if (usernameError.value.isNotEmpty || passwordError.value.isNotEmpty) {
      return false;
    }

    isLoading.value = true;
    try {
      // Simulate API call (replace with actual API call in production)
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      // Handle any errors during login
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
    // Dispose controllers to prevent memory leaks
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}