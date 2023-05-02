import 'dart:convert';

import 'package:energy_meter/shared/constant.dart';
import 'package:energy_meter/shared/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  String? name;
  String? company;
  String? model;
  String? category;

  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Device'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name'),
              TextField(
                autocorrect: false,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Device Name',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Company'),
              ),
              TextField(
                onChanged: (value) {
                  company = value;
                },
                enableSuggestions: false,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Company Name',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Model'),
              ),
              TextField(
                onChanged: (value) {
                  model = value;
                },
                enableSuggestions: false,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Model Name',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Category'),
              ),
              TextField(
                onChanged: (value) {
                  category = value;
                },
                enableSuggestions: false,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'gas, electric, water',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    devices.insert(
                        0,
                        MeterReading(
                            price: 1.1,
                            usedUnit: 5,
                            name: name!,
                            unit: category == 'electric'? 'kWh' : 'M3',
                            meterType: category ?? 'electric',
                            deviceInfo: DeviceInfo(
                                name: name!,
                                company: company!,
                                model: model!,
                                category: category!)));
                    storage.write(
                        key: 'device_${name?.replaceAll(' ', '_')}',
                        value: json.encode(devices[0].toStringValue()));
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
