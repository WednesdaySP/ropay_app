import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/device_Id/device_id_controller.dart';
import 'package:ropay_app/routes/app_routes.dart';
import 'package:ropay_app/widgets/qr_scanner_screen.dart';

class DeviceIdScreen extends StatelessWidget {
  const DeviceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceIdController controller = Get.put(DeviceIdController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Device ID', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryBlue,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Enter Device ID or Scan QR Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please provide the unique 6-character Device ID linked to your RoPay device or scan the QR code to sync with your device information.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Obx(() => Column( // Wrap the dynamic section in Obx
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: controller.deviceIdController,
                    decoration: InputDecoration(
                      labelText: 'Device ID (6 characters)',
                      errorText: controller.deviceIdError.value.isNotEmpty
                          ? controller.deviceIdError.value
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: white,
                    ),
                    maxLength: 6,
                    onChanged: (value) => controller.validateDeviceId(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const QRScannerScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          foregroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Scan QR'),
                      ),
                      ElevatedButton(
                        onPressed: controller.deviceIdError.value.isEmpty &&
                                controller.deviceIdController.text.length == 6
                            ? () {
                                controller.syncDevice();
                                Get.offNamed(AppRoutes.mainNavigation);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.deviceIdError.value.isEmpty &&
                                  controller.deviceIdController.text.length == 6
                              ? primaryBlue
                              : Colors.grey,
                          foregroundColor: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text('Sync'),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}