import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/home_screen/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)], // Light blue gradient for light theme
          ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(fontSize: 16, color: black),
                        ),
                        Text(
                          'Shashi Prabha',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryBlue),
                        ),
                      ],
                    ),
                    Icon(Icons.notifications, color: black),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(10, 10),
                          blurRadius: 15,
                          spreadRadius: -5,
                        ),
                        BoxShadow(
                          color: Colors.white70,
                          offset: Offset(-10, -10),
                          blurRadius: 15,
                          spreadRadius: -5,
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
                            valueColor: const AlwaysStoppedAnimation<Color>(primaryBlue),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.water_drop, size: 60, color: primaryBlue),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              '${controller.lastIntakeTime.value}',
                              style: const TextStyle(fontSize: 16),
                            )),
                        Obx(() => Text(
                              '${controller.lastIntakeAmount.value.toInt()}ml water (${controller.lastIntakeGlasses.value} glass${controller.lastIntakeGlasses.value == 1 ? '' : 'es'})',
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            )),
                      ],
                    ),
                    _buildNeumorphicButton(
                      onPressed: () => controller.addGoal(),
                      child: const Text('Add Your Goal'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(5, 5),
                        blurRadius: 10,
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Target', style: TextStyle(fontSize: 16, color: primaryBlue)),
                          Text('2000ml', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('10%', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          Text('100ml', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: _buildNeumorphicButton(
                    onPressed: () {},
                    child: const Text('Go To Dashboard'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'You got 50% of today\'s goal, keep focus on your health!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analysis'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: 0,
          selectedItemColor: primaryBlue,
          onTap: (index) {},
        ),
      ),
    );
  }

  Widget _buildNeumorphicButton({required VoidCallback onPressed, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(5, 5),
            blurRadius: 10,
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