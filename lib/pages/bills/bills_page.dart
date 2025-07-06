import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/pages/bills/bills_controller.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BillsController controller = Get.put(BillsController());

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text('Bills', style: TextStyle(color: black)),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Monthly Water Bills',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryBlue),
                  ),
                  Obx(()=> DropdownButton<String>(
                      value: controller.selectedMonth.value,
                      items: <String>['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(color: primaryBlue)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.changeMonth(newValue);
                        }
                      },
                      dropdownColor: white,
                      style: const TextStyle(color: primaryBlue),
                      underline: const SizedBox(),
                      icon: const Icon(Icons.arrow_drop_down, color: primaryBlue),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: controller.bills.length,
                    itemBuilder: (context, index) {
                      final bill = controller.bills[index];
                      return Card(
                        color: white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          leading: const Icon(Icons.water_drop, color: primaryBlue, size: 40),
                          title: Text(
                            'Bill for ${controller.selectedMonth.value} ${bill['year']}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            'Usage: ${bill['usage']} liters\nCost: ₹${bill['cost']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          trailing: const Icon(Icons.receipt, color: primaryBlue),
                          onTap: () {
                            // Navigate to bill details screen if needed
                          },
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}