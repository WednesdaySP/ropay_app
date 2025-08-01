import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/constants/string_constants.dart';
import 'package:ropay_app/constants/text_styles.dart';
import 'package:ropay_app/pages/login_screen/login_controller.dart';
import 'package:ropay_app/routes/app_routes.dart';
import 'package:ropay_app/widgets/custom_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/images/droplet.jpg', width: 90, height: 80,),
              const SizedBox(height: 16,),
              const Text(
                "Welcome Back",
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12,),
              const Text(
                "We are glad to see you again!\n Please select your role",
                style: labelStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12,),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectRole('Customer');
                    },
                    child: customAccountField(
                      'assets/images/customer.jpg',
                      'Customer',
                      controller.selectedRole.value == 'Customer',
                    ),
                  ),
                  const SizedBox(width: 12,),
                  GestureDetector(
                    onTap: () {
                      controller.selectRole('Vendor');
                    },
                    child: customAccountField(
                      'assets/images/vendor.jpg',
                      'Vendor',
                      controller.selectedRole.value == 'Vendor',
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 24),
              Obx(() => CustomTextField(
                    controller: controller.mobileController,
                    label: mobileLabel,
                    errorText: controller.mobileError.value,
                    keyboardType: TextInputType.phone,
                    onChanged: (_) => controller.validateMobile(),
                  )),
              const SizedBox(height: 16),
              Obx(() => CustomTextField(
                    controller: controller.passwordController,
                    label: 'OTP',
                    errorText: controller.passwordError.value,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => controller.validatePassword(),
                  )),
              const SizedBox(height: 24),
              Obx(() => CustomButton(
                    isLoading: controller.isLoading.value,
                    isEnabled: controller.mobileError.value.isEmpty &&
                        controller.passwordError.value.isEmpty &&
                        controller.selectedRole.value.isNotEmpty,
                    onPressed: () async {
                      try {
                        if (await controller.login()) {
                          Get.offNamed(AppRoutes.mainNavigation);
                        } else {
                          Get.snackbar(
                            errorTitle,
                            'Login failed. Please check your credentials.',
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
                    text: 'Login',
                  )),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Get.toNamed('/register'),
                child: const Text(
                  'Don’t have an account? Register',
                  style: loginPromptStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column customAccountField(String image, String text, bool isSelected) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 150,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Image.asset(image, fit: BoxFit.fill,),
        ),
        const SizedBox(height: 12,),
        Text(
          text,
          style: labelStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

