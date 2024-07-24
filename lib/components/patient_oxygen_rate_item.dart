import 'package:flutter/material.dart';
import 'package:sycamore_project/components/patient_line_graph.dart';

class PatientOxygenRateItem extends StatelessWidget {
  const PatientOxygenRateItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      height: 270,
      width: 140,
      child: const Column(
        children: [
          Text(
            'oxygen rate',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, // Set your desired aspect ratio here
              child: PatientLineGraph(aspectRatio: 0.55,
                bottomReservedSize: 27,
                leftReservedSize: 36,
                leftInterval: 20,
                bottomInterval: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
