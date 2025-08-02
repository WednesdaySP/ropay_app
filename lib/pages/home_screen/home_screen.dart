import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/home_screen/home_controller.dart';
import 'package:ropay_app/widgets/iot_data_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: accentBlue
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'greeting'.tr,
                          style: TextStyle(fontSize: 14, color: black,fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'User Name',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                    Icon(Icons.notifications_active_outlined, color: black,size: 28,),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(10, 10),
                          blurRadius: 15,
                          spreadRadius: -5,
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(-10, -10),
                          blurRadius: 15,
                          spreadRadius: -8,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: CircularProgressIndicator(
                            value: controller.currentIntake.value / controller.targetIntake.value,
                            strokeWidth: 10,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.water_drop, size: 60, color: Colors.blue),
                            Obx(() => Text(
                                  '${controller.currentIntake.value.toInt()}ml',
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              
                const SizedBox(height: 20),
                // Container(
                //   padding: const EdgeInsets.all(16.0),
                //   decoration: BoxDecoration(
                //     color: white,
                //     borderRadius: BorderRadius.circular(15),
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Colors.blueGrey,
                //         offset: Offset(5, 5),
                //         blurRadius: 10,
                //         spreadRadius: -3,
                //       ),
                //       BoxShadow(
                //         color: Colors.white70,
                //         offset: Offset(-5, -5),
                //         blurRadius: 10,
                //         spreadRadius: -3,
                //       ),
                //     ],
                //   ),
                //   child: const Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text('Target', style: TextStyle(fontSize: 16, color: primaryBlue)),
                //           Text('2000ml', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                //         ],
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Text('10%', style: TextStyle(fontSize: 16, color: Colors.grey)),
                //           Text('100ml', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 20),
                // Center(
                //   child: _buildNeumorphicButton(
                //     onPressed: () {},
                //     child: const Text('Go To Dashboard',style: TextStyle(
                //       color: white,
                //       fontSize: 14
                //     ),),
                //   ),
                // ),
                //const SizedBox(height: 20),
                // Dynamic IoT Data Cards
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    IoTDataCard(
                      title: 'ph_level'.tr,
                      value: '${controller.waterPhLevel.value} pH',
                      icon: Icons.water_drop,
                      gradientColors: [Colors.lightBlue[100]!, accentBlue],
                    ),
                    IoTDataCard(
                      title: 'temperature'.tr,
                      value: '${controller.temperature.value}°C',
                      icon: Icons.thermostat,
                      gradientColors: [Colors.teal[100]!, accentBlue],
                    ),
                    IoTDataCard(
                      title: 'water_quality_index'.tr,
                      value: '${controller.waterQualityIndex.value}',
                      icon: Icons.assessment,
                      gradientColors: [Colors.green[100]!, accentBlue],
                    ),
                    IoTDataCard(
                      title: 'filter_life'.tr,
                      value: '${controller.filterLife.value}%',
                      icon: Icons.filter_alt,
                      gradientColors: [Colors.orange[100]!, accentBlue],
                    ),
                    IoTDataCard(
                      title: 'plan_expiry_date'.tr,
                      value: controller.planExpiryDate.value,
                      icon: Icons.calendar_today,
                      gradientColors: [Colors.purple[100]!, accentBlue],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNeumorphicButton({required VoidCallback onPressed, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
     
        gradient: LinearGradient(colors: [
       Colors.purple[100]!,
        accentBlue,
        ],begin: Alignment.topLeft,
        end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(5, 5),
            blurRadius: 5,
            spreadRadius: -3,
          ),
          BoxShadow(
            color: Colors.white70,
            offset: Offset(-5, -5),
            blurRadius: 10,
            spreadRadius: -3,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: child,
      ),
    );
  }
}