import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class RegisterController extends GetxController {
  // Controllers for text fields
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final locationController = TextEditingController();

  // Reactive variables
  final isLoading = false.obs;
  final nameError = ''.obs;
  final mobileError = ''.obs;
  final locationError = ''.obs;

  // Validate name field
  void validateName() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      nameError.value = 'Name is required';
    } else if (name.length < 2) {
      nameError.value = 'Name must be at least 2 characters';
    } else {
      nameError.value = '';
    }
  }

  // Validate mobile number field
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

  // Validate location field
  void validateLocation() {
    final location = locationController.text.trim();
    if (location.isEmpty) {
      locationError.value = 'Location is required';
    } else {
      locationError.value = '';
    }
  }

  // Handle registration process
  Future<bool> register() async {
    // Validate all fields before proceeding
    validateName();
    validateMobile();
    validateLocation();

    // Check if there are any validation errors
    if (nameError.value.isNotEmpty ||
        mobileError.value.isNotEmpty ||
        locationError.value.isNotEmpty) {
      return false;
    }

    isLoading.value = true;
    try {
      // Simulate API call (replace with actual API call in production)
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      // Handle any errors during registration
      Get.snackbar(
        'Error',
        'Registration failed: $e',
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
    nameController.dispose();
    mobileController.dispose();
    locationController.dispose();
    super.onClose();
  }
}