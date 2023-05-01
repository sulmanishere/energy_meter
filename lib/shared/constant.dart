import 'package:energy_meter/shared/interfaces.dart';
import 'package:flutter/material.dart';

List<MeterReading> devices = [
  // MeterReading(
  //     price: 1.25,
  //     usedUnit: 278,
  //     name: 'Gas 1',
  //     unit: 'M3',
  //     meterType: 'gas',
  //     deviceInfo: DeviceInfo(
  //         name: 'Gas 1', company: 'abc', model: 'model a', category: 'gas')),
  // MeterReading(
  //     price: 5.75,
  //     usedUnit: 25,
  //     name: 'Electric 1',
  //     unit: 'kWh',
  //     meterType: 'electric',
  //     deviceInfo: DeviceInfo(
  //         name: 'Electric 1',
  //         company: 'elec',
  //         model: 'model a',
  //         category: 'electric')),
  // MeterReading(
  //     price: 3.65,
  //     usedUnit: 75,
  //     name: 'Water 1',
  //     unit: 'M3',
  //     meterType: 'water',
  //     deviceInfo: DeviceInfo(
  //         name: 'Water 1',
  //         company: 'watr',
  //         model: 'model wta',
  //         category: 'water')),
];

final isUserLogin = ValueNotifier<bool>(false);
