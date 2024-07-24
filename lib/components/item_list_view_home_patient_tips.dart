import 'package:flutter/material.dart';
import 'package:sycamore_project/components/tips_for_patient_health_screen_tab_bar.dart';

import '../constants.dart';
import '../core/helper_methods.dart';
import '../models/tips_patient_home_page_model.dart';

class ItemListViewHomePatientTips extends StatelessWidget {
  const ItemListViewHomePatientTips({
    super.key,
    required this.item,
    required this.showSeeMoreButton,
  });

  final HomePatientTipsModel item;
  final bool showSeeMoreButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          color: Colors.black,
          size: 8,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(item.text,style: const TextStyle(fontSize: 12),),
        if (showSeeMoreButton)
          GestureDetector(
            onTap: () {
              navigateTo(page: const TipsForPatientHealthScreenTabBar(),withHistory: true);
            },
            child: const Text(
              "\t\tSee More...",
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
      ],
    );
  }
}
