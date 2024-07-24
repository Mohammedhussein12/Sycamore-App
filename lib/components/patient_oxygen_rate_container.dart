import 'package:flutter/material.dart';

import '../constants.dart';

class PatientOxygenRateContainer extends StatelessWidget {
  const PatientOxygenRateContainer({
    super.key,
    required this.color,
    required this.text,
    required this.oxygenRate,
    required this.width,
    required this.height,
    this.textColor = kPrimaryColor,this.fontSize = 18,
  });

  final Color color;
  final String text;
  final String oxygenRate;
  final double width;
  final double height;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
          const Spacer(),
          Text(
            '$oxygenRate',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
