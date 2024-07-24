import 'package:flutter/material.dart';
import 'package:sycamore_project/models/breathing_exercises_model.dart';
import '../constants.dart';
import '../controllers/breathing_exercises_controller.dart';
import 'item_list_view_breathing_exercises.dart';

class ListViewBreathingWays extends StatelessWidget {
  ListViewBreathingWays({
    super.key,
  });

  final controller = BreathingExerciseController();

  @override
  Widget build(BuildContext context) {

    List<BreathingExerciseModel> exercisesWays = [];
    if(myChoise == 'embolism'){
      exercisesWays = controller.pulmonaryEmbolismExercisesWays;
    }
    else{
      exercisesWays = controller.exercisesWays;
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        return ItemListViewBreathingExercises(
            item: exercisesWays[index]);
      },
      itemCount: exercisesWays.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
