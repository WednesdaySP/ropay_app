import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/constants/string_constants.dart';
import 'package:ropay_app/constants/text_styles.dart';
import 'package:ropay_app/pages/signIn/sign_in_controller.dart';
import 'package:ropay_app/routes/app_routes.dart';
import 'package:ropay_app/widgets/custom_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final SignInController controller = Get.put(SignInController());
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
                "Welcome ",
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12,),
              const Text(
                "We are glad to see you!\n Please select your role",
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
           
              const SizedBox(height: 20),
             
              Obx(() => CustomButton(
                    isLoading: controller.isLoading.value,
                    isEnabled:
                        controller.selectedRole.value.isNotEmpty,
                    onPressed: () async {
                      try {
                        if (await controller.login()) {
                          Get.offNamed(AppRoutes.register);
                        } else {
                          Get.snackbar(
                            errorTitle,
                            'Selection failed. Please select your role.',
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
                    text: 'Start',
                  )),
           
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
          height: 150,
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