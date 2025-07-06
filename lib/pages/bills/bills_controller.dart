import 'package:get/get.dart';

class BillsController extends GetxController {
  final selectedMonth = 'July'.obs;
  final bills = <Map<String, dynamic>>[
    {'year': 2025, 'usage': 150, 'cost': 75},
    {'year': 2025, 'usage': 200, 'cost': 100},
    {'year': 2025, 'usage': 180, 'cost': 90},
  ].obs;

  void changeMonth(String newMonth) {
    selectedMonth.value = newMonth;
    // Simulate fetching bills for the selected month (replace with actual API call)
    bills.assignAll([
      {'year': 2025, 'usage': 150 + (newMonth == 'July' ? 0 : 20), 'cost': 75 + (newMonth == 'July' ? 0 : 10)},
      {'year': 2025, 'usage': 200 + (newMonth == 'July' ? 0 : 30), 'cost': 100 + (newMonth == 'July' ? 0 : 15)},
      {'year': 2025, 'usage': 180 + (newMonth == 'July' ? 0 : 25), 'cost': 90 + (newMonth == 'July' ? 0 : 12)},
    ]);
  }
}