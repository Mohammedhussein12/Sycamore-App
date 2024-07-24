import 'package:flutter/material.dart';
import '../constants.dart';

class PatientReportItem extends StatelessWidget {
  const PatientReportItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Name :',
              style: TextStyle(
                  color: kPrimaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
