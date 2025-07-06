import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/device_selection/device_selection_controller.dart';

class DeviceSelectionPage extends StatelessWidget {
  const DeviceSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceSelectionController controller = Get.put(DeviceSelectionController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Device', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryBlue,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
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
              Expanded(
                child: ListView(
                  children: [
                    _buildDeviceCard(context, 'RoPay', controller),
                    const SizedBox(height: 16),
                    _buildDeviceCard(context, 'RoPay Quant', controller),
                    const SizedBox(height: 16),
                    _buildDeviceCard(context, 'RoPay Pure', controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceCard(BuildContext context, String deviceName, DeviceSelectionController controller) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFE3F2FD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              deviceName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.selectDevice(deviceName);
                Get.toNamed('/device-id');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('Sync'),
            ),
          ],
        ),
      ),
    );
  }
}

