import 'package:flutter/material.dart';
import '../controllers/tips_patient_home_page_controller.dart';
import 'item_list_view_home_patient_tips.dart';

class ListViewPatientHomeTips extends StatelessWidget {
  const ListViewPatientHomeTips({
    super.key,
    required this.controller,
  });

  final HomePatientTipsController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.tips.length,
      itemBuilder: (context, index) {
        return ItemListViewHomePatientTips(
          item: controller.tips[index],
          showSeeMoreButton: index == controller.tips.length - 1,
        );
      },
    );
  }
}