import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class RegisterController extends GetxController {
  // Controllers for text fields
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();

  // Reactive variables
  final isLoading = false.obs;
  final nameError = ''.obs;
  final mobileError = ''.obs;
  final addressError = ''.obs;
  final cityError = ''.obs;
  final stateError = ''.obs;
  final pincodeError = ''.obs;

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

  // Validate address field
  void validateAddress() {
    final address = addressController.text.trim();
    if (address.isEmpty) {
      addressError.value = 'Address is required';
    } else {
      addressError.value = '';
    }
  }

  // Validate city field
  void validateCity() {
    final city = cityController.text.trim();
    if (city.isEmpty) {
      cityError.value = 'City is required';
    } else {
      cityError.value = '';
    }
  }

  // Validate state field
  void validateState() {
    final state = stateController.text.trim();
    if (state.isEmpty) {
      stateError.value = 'State is required';
    } else {
      stateError.value = '';
    }
  }

  // Validate pincode field
  void validatePincode() {
    final pincode = pincodeController.text.trim();
    if (pincode.isEmpty) {
      pincodeError.value = 'Pincode is required';
    } else if (!RegExp(r'^\d{6}$').hasMatch(pincode)) {
      pincodeError.value = 'Enter a valid 6-digit pincode';
    } else {
      pincodeError.value = '';
    }
  }

  // Handle registration process
  Future<bool> register() async {
    // Validate all fields before proceeding
    validateName();
    validateMobile();
    validateAddress();
    validateCity();
    validateState();
    validatePincode();

    // Check if there are any validation errors
    if (nameError.value.isNotEmpty ||
        mobileError.value.isNotEmpty ||
        addressError.value.isNotEmpty ||
        cityError.value.isNotEmpty ||
        stateError.value.isNotEmpty ||
        pincodeError.value.isNotEmpty) {
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
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.onClose();
  }
}