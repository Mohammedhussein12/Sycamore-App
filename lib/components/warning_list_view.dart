import 'package:flutter/material.dart';
import 'package:sycamore_project/controllers/warning_controller.dart';

import 'item_warnings_list_view.dart';

class WarningsListView extends StatelessWidget {
  WarningsListView({
    super.key,
  });

  final WarningController warningController = WarningController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) =>
      const SizedBox(
        height: 10,
      ),
      itemCount: warningController.warnings.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ItemWarningsListView(
          warning: warningController.warnings[index],
        );
      },
    );
  }
}
