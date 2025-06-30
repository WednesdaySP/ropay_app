import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/constants/string_constants.dart';
import 'package:ropay_app/constants/text_styles.dart';


import 'package:ropay_app/pages/login_screen/login_controller.dart';
import 'package:ropay_app/widgets/custom_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  appName,
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Obx(() => CustomTextField(
                      controller: controller.usernameController,
                      label: 'Username',
                      errorText: controller.usernameError.value,
                      onChanged: (_) => controller.validateUsername(),
                    )),
                const SizedBox(height: 16),
                Obx(() => CustomTextField(
                      controller: controller.passwordController,
                      label: 'Password',
                      errorText: controller.passwordError.value,
                      obscureText: true,
                      onChanged: (_) => controller.validatePassword(),
                    )),
                const SizedBox(height: 24),
                Obx(() => CustomButton(
                      isLoading: controller.isLoading.value,
                      isEnabled: controller.usernameError.value.isEmpty &&
                          controller.passwordError.value.isEmpty,
                      onPressed: () async {
                        try {
                          if (await controller.login()) {
                            Get.offNamed('/home');
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
      ),
    );
  }
}