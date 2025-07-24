import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

// Data model for Data_Pack
class DataPack {
  final String date;
  final String time;
  final double volumeOfWater;
  final double totalWaterFlow;
  final int pumpStatus;
  final int wifiRssi;
  final double pH;
  final int tds;
  final int crc;

  DataPack({
    required this.date,
    required this.time,
    required this.volumeOfWater,
    required this.totalWaterFlow,
    required this.pumpStatus,
    required this.wifiRssi,
    required this.pH,
    required this.tds,
    required this.crc,
  });

  factory DataPack.fromString(String data) {
    final parts = data.split(',');
    if (parts.length != 9) {
      throw FormatException('Invalid Data_Pack format: expected 9 fields');
    }
    return DataPack(
      date: parts[0],
      time: parts[1],
      volumeOfWater: double.parse(parts[2]),
      totalWaterFlow: double.parse(parts[3]),
      pumpStatus: int.parse(parts[4]),
      wifiRssi: int.parse(parts[5]),
      pH: double.parse(parts[6]),
      tds: int.parse(parts[7]),
      crc: int.parse(parts[8]),
    );
  }

  @override
  String toString() {
    return 'DataPack(date: $date, time: $time, volumeOfWater: $volumeOfWater, '
        'totalWaterFlow: $totalWaterFlow, pumpStatus: $pumpStatus, '
        'wifiRssi: $wifiRssi, pH: $pH, tds: $tds, crc: $crc)';
  }
}

