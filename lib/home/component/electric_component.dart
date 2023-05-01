import 'package:energy_meter/shared/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ElectricComponent extends StatelessWidget {
  MeterReading reading;
  ElectricComponent({Key? key, required this.reading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  reading.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Icon(
                  reading.meterType == 'electric'
                      ? Icons.electric_bolt_rounded
                      : reading.meterType == 'gas'
                          ? Icons.fireplace_rounded
                          : Icons.water_drop_rounded,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Center(
              child: Text(
            'Usage: ${reading.usedUnit.toStringAsFixed(2)} ${reading.unit}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          )
              //     SleekCircularSlider(
              //   appearance: CircularSliderAppearance(
              //     infoProperties: InfoProperties(
              //       // topLabelText: '89 kWh',
              //       // bottomLabelText: '88 kw',
              //       modifier: (percentage) =>
              //           '${percentage.toInt()} ${reading.unit}',
              //     ),
              //     customWidths: CustomSliderWidths(progressBarWidth: 10),
              //   ),
              //   min: 0,
              //   max: reading.usedUnit * 2,
              //   initialValue: reading.usedUnit,
              // ),
              ),
          const Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '£${reading.price.toStringAsFixed(2)} Today',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
