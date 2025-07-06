import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/constants/string_constants.dart';
import 'package:ropay_app/constants/text_styles.dart';
import 'package:ropay_app/pages/register/register_controller.dart';
import 'package:ropay_app/widgets/custom_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('assets/images/droplet.jpg', width: 90, height: 80,),
                const SizedBox(height: 16,),
                const Text(
                  "Ropay Registertion",
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8,),
                const Text(
                  "Get Started with Ropay! Register to connect your tap device and track your water consumption.",
                  style: labelStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Obx(() => CustomTextField(
                      controller: controller.nameController,
                      label: nameLabel,
                      errorText: controller.nameError.value,
                      onChanged: (_) => controller.validateName(),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: controller.mobileController,
                      label: mobileLabel,
                      errorText: controller.mobileError.value,
                      keyboardType: TextInputType.phone,
                      onChanged: (_) => controller.validateMobile(),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: controller.addressController,
                      label: 'Complete Address',
                      errorText: controller.addressError.value,
                      onChanged: (_) => controller.validateAddress(),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: controller.cityController,
                      label: 'City',
                      errorText: controller.cityError.value,
                      onChanged: (_) => controller.validateCity(),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: controller.stateController,
                      label: 'State',
                      errorText: controller.stateError.value,
                      onChanged: (_) => controller.validateState(),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: controller.pincodeController,
                      label: 'Pincode',
                      errorText: controller.pincodeError.value,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => controller.validatePincode(),
                    )),
                const SizedBox(height: 24),
                Obx(() => CustomButton(
                      isLoading: controller.isLoading.value,
                      isEnabled: controller.nameError.value.isEmpty &&
                          controller.mobileError.value.isEmpty &&
                          controller.addressError.value.isEmpty &&
                          controller.cityError.value.isEmpty &&
                          controller.stateError.value.isEmpty &&
                          controller.pincodeError.value.isEmpty,
                      onPressed: () async {
                        try {
                          if (await controller.register()) {
                            Get.offNamed('/device-selection');
                          } else {
                            Get.snackbar(
                              errorTitle,
                              registrationFailedMessage,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                            errorTitle,
                            'An error occurred: $e',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      text: registerButtonText,
                    )),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Get.toNamed('/login'),
                  child: const Text(
                    loginPrompt,
                    style: loginPromptStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}