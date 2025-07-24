import 'package:get/get.dart';

class LocalStrings extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'RoPay',
          'mqtt_example_title': 'MQTT Example',
          'mqtt_connecting': 'Connecting to MQTT Broker...',
          'mqtt_connected': 'Connected to MQTT Broker',
          'mqtt_disconnected': 'Disconnected from MQTT Broker',
          'data_packet_received': 'Data Packet Received',
          // Add more strings as needed
        },
        // Add other locales here
        'hi_IN': {
          'app_title': 'रोपे',
          'mqtt_example_title': 'MQTT उदाहरण',
          'mqtt_connecting': 'MQTT ब्रोकर से कनेक्ट हो रहा है...',
          'mqtt_connected': 'MQTT ब्रोकर से कनेक्टेड',
          'mqtt_disconnected': 'MQTT ब्रोकर से डिस्कनेक्टेड',
          'data_packet_received': 'डेटा पैकेट प्राप्त हुआ',
          // Add more strings as needed
        }
      };
}