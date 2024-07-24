import 'package:flutter/material.dart';
import '../controllers/nutrition_tips_controller.dart';
import '../core/get_nutrition_tips.dart';
import '../models/nutrition_tips_model.dart';
import 'item_list_view_nutrition_tips.dart';

class ListViewNutritionTips extends StatelessWidget {
  const ListViewNutritionTips({
    super.key,
    required this.controller,
  });

  final NutritionTipsController controller;

  @override
  Widget build(BuildContext context) {
    List<NutritionTipsModel> tips = getNutritionTips();
    return ListView.builder(
        itemBuilder: (context, index) {
          return ItemListViewNutritionTips(
            model: tips[index],
          );
        },
        itemCount: tips.length);
  }
}
