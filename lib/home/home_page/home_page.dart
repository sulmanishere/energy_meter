import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:energy_meter/home/component/electric_component.dart';
import 'package:energy_meter/home/home_page/add_device.dart';
import 'package:energy_meter/home/home_page/device_details.dart';
import 'package:energy_meter/login/login.dart';
import 'package:energy_meter/profile/profile.dart';
import 'package:energy_meter/shared/constant.dart';
import 'package:energy_meter/shared/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = FlutterSecureStorage();

  Timer? timer;
  @override
  void initState() {
    updateData();
    super.initState();
  }

  updateValue() async {
    for (MeterReading device in devices) {
      await storage.write(
          key: 'device_${device.name}',
          value: json.encode(device.toStringValue()));
    }
  }

  updateData() async {
    Map<String, String> list = await storage.readAll();
    devices = [];
    //double val = double.parse((Random().nextDouble() * 34).toStringAsFixed(2));
    for (var key in list.keys) {
      if (key.contains('device')) {
        final device = json.decode(list[key]!);

        devices.add(MeterReading(
          price: device['price'] + 0.14,
          usedUnit: device['used_unit'] + 0.14,
          unit: device['unit'],
          name: device['name'] ?? 'Device',
          meterType: device['type'],
          deviceInfo: DeviceInfo(
              name: device['device_info']['name'],
              company: device['device_info']['company'],
              model: device['device_info']['model'],
              category: device['device_info']['category']),
        ));
      }
    }
    updateValue();
    setState(() {});

    timer = Timer(const Duration(seconds: 10), () {
      updateData();
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double total = devices.isEmpty
        ? 0
        : devices
            .map((e) => e.price)
            .reduce((value, element) => element + value);
    return ValueListenableBuilder(
        valueListenable: isUserLogin,
        builder: (context, bool value, child) => !value
            ? const Login()
            : Scaffold(
                appBar: AppBar(
                  title: const Text('Energy meter'),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.account_circle),
                      ),
                    )
                  ],
                ),
                body: SafeArea(
                    child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: devices
                              .map((device) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DeviceDetails(reading: device),
                                          )).then((value) => updateData());
                                    },
                                    child: ElectricComponent(
                                      reading: device,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.lightGreen,
                      child: Center(
                          child: Text(
                        'Total: £${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )),
                    )
                  ],
                )),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddDevice(),
                        )).then((value) {
                      setState(() {});
                    }).then((value) => updateData());
                    // updateData();
                  },
                  child: const Icon(Icons.add),
                ),
                // drawer: Drawer(
                //   child: ListView(padding: EdgeInsets.zero, children: [
                //     DrawerHeader(
                //       decoration: const BoxDecoration(
                //         color: Colors.blue,
                //       ),
                //       child: Column(
                //         children: const [
                //           Icon(
                //             Icons.electric_meter,
                //             size: 80,
                //           ),
                //           Text(
                //             'Energy Meter',
                //             style: TextStyle(fontSize: 24),
                //           ),
                //         ],
                //       ),
                //     ),
                //     ListTile(
                //       iconColor: Colors.amber,
                //       title: const Text('Electric'),
                //       onTap: () {},
                //       leading: const Icon(Icons.electric_bolt_rounded),
                //     ),
                //     ListTile(
                //       iconColor: Colors.amber,
                //       title: const Text('Gas'),
                //       onTap: () {},
                //       leading: const Icon(Icons.gas_meter_rounded),
                //     ),
                //     ListTile(
                //       iconColor: Colors.amber,
                //       title: const Text('Setting'),
                //       onTap: () {},
                //       leading: const Icon(Icons.settings),
                //     ),
                //     ListTile(
                //       iconColor: Colors.amber,
                //       title: const Text('Theme'),
                //       onTap: () {},
                //       leading: const Icon(Icons.style),
                //     ),
                //     ListTile(
                //       iconColor: Colors.amber,
                //       title: const Text('About'),
                //       onTap: () {},
                //       leading: const Icon(Icons.info_outline_rounded),
                //     ),
                //   ]),
                // ),
              ));
  }
}
