import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import '../components/list_view_breathing_exercises.dart';
import '../components/list_view_breathing_exercises_ways.dart';

class PatientBreathingExercisesScreen extends StatelessWidget {
  const PatientBreathingExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListViewBreathingExercises(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'How can i do this ? :',
                style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ListViewBreathingWays(),
            ],
          ),
        ),
      ),
    );
  }
}
