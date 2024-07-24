import 'package:flutter/material.dart';
import 'package:sycamore_project/models/breathing_exercises_model.dart';
import '../controllers/breathing_exercises_controller.dart';
import '../core/get_breathing_tips.dart';
import 'item_list_view_breathing_exercises.dart';

class ListViewBreathingExercises extends StatelessWidget {
  ListViewBreathingExercises({
    super.key,
  });

  final controller = BreathingExerciseController();

  @override
  Widget build(BuildContext context) {
    List<BreathingExerciseModel> exercises = getBreathingTips();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ItemListViewBreathingExercises(
          item: exercises[index],
        );
      },
      itemCount: exercises.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
