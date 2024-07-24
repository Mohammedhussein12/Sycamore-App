import 'package:flutter/material.dart';
import 'package:sycamore_project/models/warning_model.dart';

class ItemWarningsListView extends StatelessWidget {
  const ItemWarningsListView({
    super.key,
    required this.warning,
  });

  final WarningModel warning;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 10,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          warning.warning,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ],
    );
  }
}
