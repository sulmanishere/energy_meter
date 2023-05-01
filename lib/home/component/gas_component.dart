import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class GasComponent extends StatefulWidget {
  const GasComponent({Key? key}) : super(key: key);

  @override
  _GasComponentState createState() => _GasComponentState();
}

class _GasComponentState extends State<GasComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Gas A',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Icon(
                  Icons.fireplace_rounded,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Center(
              child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
              infoProperties: InfoProperties(
                // topLabelText: '89 m³',
                // bottomLabelText: '88 m³',
                modifier: (percentage) => '${percentage.toInt()} m³',
              ),
              customWidths: CustomSliderWidths(progressBarWidth: 10),
            ),
            min: 0,
            max: 100,
            initialValue: 30,
          )),
          const Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '£1.58 Today',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
