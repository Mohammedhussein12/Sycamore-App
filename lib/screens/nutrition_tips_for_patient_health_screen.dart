import 'package:flutter/material.dart';
import 'package:sycamore_project/controllers/nutrition_tips_controller.dart';
import '../components/list_view_nutrition_tips.dart';

class NutritionTipsForPatientHealth extends StatelessWidget {
  const NutritionTipsForPatientHealth({super.key, required this.controller});

  final NutritionTipsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewNutritionTips(
        controller: controller,
      ),
    );
  }
}
