import 'package:flutter/material.dart';
import 'package:sycamore_project/components/patient_heart_rate_line_chart.dart';

class PatientHeartRateItem extends StatelessWidget {
  const PatientHeartRateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(
          right: 10, top: 10, bottom: 5, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      height: 270,
      width: 140,
      child:  const Column(
        children: [
          Text(
            'Heart rate',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: PatientHeartRateLineChart()),
          Text(
            '190',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}