import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:ropay_app/models/data_packet_model.dart';

class MqttExample extends StatefulWidget {
  const MqttExample({super.key});

  @override
  _MqttExampleState createState() => _MqttExampleState();
}

class _MqttExampleState extends State<MqttExample> {
  MqttServerClient? client;
  String status = 'Disconnected';
  DataPack? receivedData; // Store the latest DataPack

  @override
  void initState() {
    super.initState();
    connectToBroker();
  }

  Future<void> connectToBroker() async {
    // Initialize the MQTT client with broker.emqx.io
    client = MqttServerClient(
      'broker.emqx.io',
      'flutter_client_${DateTime.now().millisecondsSinceEpoch}',
    );
    client!.port = 1883;
    client!.logging(on: true);
    client!.keepAlivePeriod = 60;
    client!.autoReconnect = true;
    client!.resubscribeOnAutoReconnect = true;
    client!.setProtocolV311();

    // Set callbacks
    client!.onConnected = onConnected;
    client!.onDisconnected = onDisconnected;
    client!.onSubscribed = onSubscribed;
    client!.onAutoReconnect = onAutoReconnect;

    // Set connection message
    final connMessage = MqttConnectMessage()
        .withWillTopic('flutter/test/topic')
        .withWillMessage('Flutter client disconnected unexpectedly')
        .withClientIdentifier(
            'flutter_client_${DateTime.now().millisecondsSinceEpoch}')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client!.connectionMessage = connMessage;

    try {
      setState(() {
        status = 'Connecting to broker.emqx.io...';
      });
      await client!.connect();
    } catch (e) {
      setState(() {
        status = 'Connection failed: $e';
      });
      client!.disconnect();
      return;
    }
  }

  // Callback when connected
  void onConnected() {
    setState(() {
      status = 'Connected to broker.emqx.io';
    });

    // Subscribe to topic
    client!.subscribe('flutter/test/topic', MqttQos.atLeastOnce);

    // Listen for incoming messages
    client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      try {
        // Parse the payload into DataPack
        final dataPack = DataPack.fromString(payload);
        setState(() {
          receivedData = dataPack;
          status = 'Received data on ${c[0].topic}';
        });
      } catch (e) {
        setState(() {
          status = 'Error parsing message: $e';
        });
      }
    });
  }

  // Callback when disconnected
  void onDisconnected() {
    setState(() {
      status = 'Disconnected from broker.emqx.io';
    });
  }

  // Callback when subscribed
  void onSubscribed(String topic) {
    setState(() {
      status = 'Subscribed to $topic';
    });
  }

  // Callback for auto-reconnect
  void onAutoReconnect() {
    setState(() {
      status = 'Attempting to reconnect to broker.emqx.io...';
    });
  }

  // Publish a test message (for testing purposes)
  void publishMessage() {
    if (client?.connectionStatus?.state == MqttConnectionState.connected) {
      const pubTopic = 'flutter/test/topic';
      final builder = MqttClientPayloadBuilder();
      // Example Data_Pack string
      builder.addString('2025-07-22,21:57:00,100.5,500.0,1,-50,7.2,300,1234');
      client!.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);
      setState(() {
        status = 'Message published to $pubTopic';
      });
    } else {
      setState(() {
        status = 'Cannot publish: Not connected';
      });
    }
  }

  @override
  void dispose() {
    client?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mqtt_example_title'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: $status', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('Received Data:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            if (receivedData != null) ...[
              Text('Date: ${receivedData!.date}'),
              Text('Time: ${receivedData!.time}'),
              Text('Volume of Water: ${receivedData!.volumeOfWater} L'),
              Text('Total Water Flow: ${receivedData!.totalWaterFlow} L'),
              Text(
                  'Pump Status: ${receivedData!.pumpStatus == 1 ? 'On' : 'Off'}'),
              Text('WiFi RSSI: ${receivedData!.wifiRssi} dBm'),
              Text('pH: ${receivedData!.pH}'),
              Text('TDS: ${receivedData!.tds} ppm'),
              Text('CRC: ${receivedData!.crc}'),
            ] else ...[
              const Text('No data received yet.'),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var local = Locale('hi', 'IN');
                
                Get.updateLocale(local);
                publishMessage();
              },
              child: const Text('Publish Test Message'),
            ),
          ],
        ),
      ),
    );
  }
}


//without data packet

// class MqttExample extends StatefulWidget {
//   const MqttExample({super.key});

//   @override
//   _MqttExampleState createState() => _MqttExampleState();
// }

// class _MqttExampleState extends State<MqttExample> {
//   MqttServerClient? client;
//   String status = 'Disconnected';
//   String receivedMessage = 'No message received';

//   @override
//   void initState() {
//     super.initState();
//     connectToBroker();
//   }

//   Future<void> connectToBroker() async {
//     // Initialize the MQTT client with broker.emqx.io
//     client = MqttServerClient(
//       'broker.emqx.io',
//       'flutter_client_${DateTime.now().millisecondsSinceEpoch}',
//     );
//     client!.port = 1883; // Default MQTT port for non-secure connection
//     client!.logging(on: true); // Enable logging for debugging
//     client!.keepAlivePeriod = 60; // Keep connection alive for 60 seconds
//     client!.autoReconnect = true; // Enable auto-reconnect
//     client!.resubscribeOnAutoReconnect = true; // Resubscribe on reconnect
//     client!.setProtocolV311(); // Use MQTT 3.1.1 protocol

//     // Set callbacks
//     client!.onConnected = onConnected;
//     client!.onDisconnected = onDisconnected;
//     client!.onSubscribed = onSubscribed;
//     client!.onAutoReconnect = onAutoReconnect;

//     // Set connection message
//     final connMessage = MqttConnectMessage()
//         .withWillTopic('flutter/test/topic') // Last will topic
//         .withWillMessage('Flutter client disconnected unexpectedly')
//         .withClientIdentifier(
//             'flutter_client_${DateTime.now().millisecondsSinceEpoch}')
//         .startClean() // Start with a clean session
//         .withWillQos(MqttQos.atLeastOnce); // QoS for will message
//     client!.connectionMessage = connMessage;

//     try {
//       setState(() {
//         status = 'Connecting to broker.emqx.io...';
//       });
//       await client!.connect();
//     } catch (e) {
//       setState(() {
//         status = 'Connection failed: $e';
//       });
//       client!.disconnect();
//       return;
//     }
//   }

//   // Callback when connected
//   void onConnected() {
//     setState(() {
//       status = 'Connected to broker.emqx.io';
//     });

//     // Subscribe to topic after connection
//     client!.subscribe('ropay/flutter/test/topic', MqttQos.atMostOnce);

//     // Listen for incoming messages
//     client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       setState(() {
//         receivedMessage = 'Topic: ${c[0].topic}, Message: $payload';
//       });
//     });
//   }

//   // Callback when disconnected
//   void onDisconnected() {
//     setState(() {
//       status = 'Disconnected from broker.emqx.io';
//     });
//   }

//   // Callback when subscribed
//   void onSubscribed(String topic) {
//     setState(() {
//       status = 'Subscribed to $topic';
//     });
//   }

//   // Callback for auto-reconnect
//   void onAutoReconnect() {
//     setState(() {
//       status = 'Attempting to reconnect to broker.emqx.io...';
//     });
//   }

//   // Publish a message
//   void publishMessage() {
//     if (client?.connectionStatus?.state == MqttConnectionState.connected) {
//       const pubTopic = 'ropay/flutter/test/topic';
//       final builder = MqttClientPayloadBuilder();
//       builder.addString('Hello from Shashi via EMQX!');
//       client!.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);
//       setState(() {
//         status = 'Message published to $pubTopic';
//       });
//     } else {
//       setState(() {
//         status = 'Cannot publish: Not connected';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     client?.disconnect();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('MQTT Flutter Example with EMQX')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Status: $status'),
//             const SizedBox(height: 20),
//             Text('Received: $receivedMessage'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: publishMessage,
//               child: const Text('Publish Message'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';

// class MqttExample extends StatefulWidget {
//   const MqttExample({super.key});

//   @override
//   State<MqttExample> createState() => _MqttExampleState();
// }

// class _MqttExampleState extends State<MqttExample> {
//   MqttServerClient? client;
//   String status = 'Disconnected';
//   String receivedMessage = 'No message received';

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     connectToBroker();
//   }

//   Future<void> connectToBroker() async {
//     // Initialize the MQTT client
//     client = MqttServerClient('broker.hivemq.com',
//         'flutter_vlient_${DateTime.now().millisecondsSinceEpoch}');
//     client!.port = 1883; // Default MQTT port
//     client!.logging(on: true); // Enable logging for debugging
//     client!.keepAlivePeriod = 60; // Keep alive period in seconds

//     // Set the connection callback
//     client!.onConnected = onConnected;
//     client!.onDisconnected = onDisconnected;
//     client!.onSubscribed = onSubscribed;

//     //set protocol versions
//     final connMesage = MqttConnectMessage()
//         .withClientIdentifier('flutter_client')
//         .startClean() // Start with a clean session
//         .withWillQos(MqttQos.atLeastOnce);
//     client!.connectionMessage = connMesage;

//     try {
//       // Connect to the MQTT broker
//       await client!.connect();
//     } catch (e) {
//       print('Connection failed: $e');
//       setState(() {
//         status = 'Connection failed';
//       });
//       client!.disconnect();
//     }

//     // Subscribe to a topic
//     client!.subscribe('flutter/test/topic', MqttQos.atLeastOnce);

//     //Listen for incoming messages
//     client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
//       final String receivedTopic = c[0].topic;
//       final String receivedPayload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       setState(() {
//         receivedMessage =
//             'Received message: $receivedPayload on topic: $receivedTopic';
//       });
//     });
//   }

//   // Callback when connected to the broker
//   void onConnected() {
//     print('Connected to the MQTT broker');
//     setState(() {
//       status = 'Connected to broker';
//     });
//   }

//   // Callback when disconnected from the broker
//   void onDisconnected() {
//     print('Disconnected from the MQTT broker');
//     setState(() {
//       status = 'Disconnected from broker';
//     });
//   }

//   // Callback when subscribed to a topic
//   void onSubscribed(String topic) {
//     print('Subscribed to topic: $topic');
//     setState(() {
//       status = 'Subscribed to $topic';
//     });
//   }

//   //publish a message to a topic
//   void publishMessage(){
//     if (client?.connectionStatus?.state == MqttConnectionState.connected) {
//       const pubTopic = 'flutter/test/topic';
//       final builder = MqttClientPayloadBuilder();
//       builder.addString('Hello from Flutter!');
//       client!.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);
//       setState(() {
//         status = 'Message published to $pubTopic';
//       });
//     } else {
//       setState(() {
//         status = 'Cannot publish: Not connected';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     client?.disconnect();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MQTT Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Status: $status'),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: publishMessage,
//               child: const Text('Publish Message'),
//             ),
//             const SizedBox(height: 16),
//             Text('Received Message: $receivedMessage'),
//           ],
//         ),
//       ),
//     );
//   }
// }

