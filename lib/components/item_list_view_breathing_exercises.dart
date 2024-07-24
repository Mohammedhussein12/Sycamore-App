import 'package:flutter/material.dart';
import '../localization_service/localization_service.dart';
import '../models/breathing_exercises_model.dart';

class ItemListViewBreathingExercises extends StatelessWidget {
  const ItemListViewBreathingExercises({
    super.key,
    required this.item,
  });

  final BreathingExerciseModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black),
      ),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(item.image??""),
        ),
        title: Text(
          LocalizationService.of(context).translate(item.title)!,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        subtitle: Text(
          LocalizationService.of(context).translate(item.subTitle)??"",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}