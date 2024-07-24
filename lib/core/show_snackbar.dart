import 'package:flutter/Material.dart';
import 'package:sycamore_project/constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(elevation: 0,
      duration: const Duration(seconds: 5),
      backgroundColor: kPrimaryColor,
      content: Text(message),
    ),
  );
}
