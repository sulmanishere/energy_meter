import 'package:energy_meter/home/component/electric_component.dart';
import 'package:energy_meter/shared/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceDetails extends StatefulWidget {
  MeterReading reading;
  DeviceDetails({Key? key, required this.reading}) : super(key: key);

  @override
  _DeviceDetailsState createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Name: ${widget.reading.deviceInfo.name}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              'Model: ${widget.reading.deviceInfo.model}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              'Company: ${widget.reading.deviceInfo.company}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              'Category: ${widget.reading.deviceInfo.category}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            ElectricComponent(reading: widget.reading),
            ElevatedButton(
                onPressed: () async {
                  await storage.delete(
                      key:
                          'device_${widget.reading.name.replaceAll(' ', '_')}');
                  Navigator.pop(context);
                },
                child: const Text('Delete Device'))
          ],
        ),
      )),
    );
  }
}
