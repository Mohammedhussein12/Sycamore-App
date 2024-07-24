import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/helper/motor.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../custom_widgets/custom_button.dart';

class OxygenRateItem extends StatefulWidget {
  const OxygenRateItem({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  _OxygenRateItemState createState() => _OxygenRateItemState();
}

class _OxygenRateItemState extends State<OxygenRateItem> {
  late double progressValue;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    progressValue = 0.0;
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.8,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.1,
                  color: Color.fromARGB(30, 0, 169, 181),
                  thicknessUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.startCurve,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: progressValue,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 30,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(
                      colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
                      stops: <double>[0.25, 0.75],
                    ),
                  ),
                  MarkerPointer(
                    value: progressValue,
                    markerType: MarkerType.circle,
                    markerHeight: 25,
                    markerWidth: 20,
                    enableAnimation: true,
                    animationDuration: 30,
                    animationType: AnimationType.linear,
                    color: const Color(0xFF87e8e8),
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.1,
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Oxygen Rate',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${progressValue.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Text(
          'please enter your appropriate\n\t\t\t\t\t\t\t\t\t\t\toxygen level here',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 150,
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: textEditingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Litres',
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              alignLabelWithHint: true, // Aligns the label with the hint text
            ),
            onChanged: (value) {
              // Update the progressValue based on the entered value
              int inputValue = int.tryParse(value) ?? 0;
              setState(() {
                if (inputValue <= 5) {
                  progressValue =
                      inputValue * 20;// Assuming 1 liter corresponds to 20%
                }
              });
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
         CustomButton(
          onTap: ()=> sendDataToNodeMCU((progressValue/20).toString()),
            text: 'submit'),
      ],
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
