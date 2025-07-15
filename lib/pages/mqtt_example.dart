import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttExample extends StatefulWidget {
  const MqttExample({super.key});

  @override
  State<MqttExample> createState() => _MqttExampleState();
}

class _MqttExampleState extends State<MqttExample> {
  MqttServerClient? client;
  String status = 'Disconnected';
  String receivedMessage = 'No message received';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectToBroker();
  }

  Future<void> connectToBroker() async {
    // Initialize the MQTT client
    client = MqttServerClient('broker.hivemq.com',
        'flutter_vlient_${DateTime.now().millisecondsSinceEpoch}');
    client!.port = 1883; // Default MQTT port
    client!.logging(on: true); // Enable logging for debugging
    client!.keepAlivePeriod = 60; // Keep alive period in seconds

    // Set the connection callback
    client!.onConnected = onConnected;
    client!.onDisconnected = onDisconnected;
    client!.onSubscribed = onSubscribed;

    //set protocol versions
    final connMesage = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .startClean() // Start with a clean session
        .withWillQos(MqttQos.atLeastOnce);
    client!.connectionMessage = connMesage;

    try {
      // Connect to the MQTT broker
      await client!.connect();
    } catch (e) {
      print('Connection failed: $e');
      setState(() {
        status = 'Connection failed';
      });
      client!.disconnect();
    }

    // Subscribe to a topic
    client!.subscribe('flutter/test/topic', MqttQos.atLeastOnce);

    //Listen for incoming messages
    client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final String receivedTopic = c[0].topic;
      final String receivedPayload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      setState(() {
        receivedMessage =
            'Received message: $receivedPayload on topic: $receivedTopic';
      });
    });
  }

  // Callback when connected to the broker
  void onConnected() {
    print('Connected to the MQTT broker');
    setState(() {
      status = 'Connected to broker';
    });
  }

  // Callback when disconnected from the broker
  void onDisconnected() {
    print('Disconnected from the MQTT broker');
    setState(() {
      status = 'Disconnected from broker';
    });
  }

  // Callback when subscribed to a topic
  void onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
    setState(() {
      status = 'Subscribed to $topic';
    });
  }

  //publish a message to a topic
  void publishMessage(){
    if (client?.connectionStatus?.state == MqttConnectionState.connected) {
      const pubTopic = 'flutter/test/topic';
      final builder = MqttClientPayloadBuilder();
      builder.addString('Hello from Flutter!');
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
      appBar: AppBar(
        title: const Text('MQTT Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: $status'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: publishMessage,
              child: const Text('Publish Message'),
            ),
            const SizedBox(height: 16),
            Text('Received Message: $receivedMessage'),
          ],
        ),
      ),
    );
  }
}
