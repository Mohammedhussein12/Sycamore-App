import 'package:flutter/material.dart';

class BottomNavigationBarController {
  int selectedItem = 0;
  List<String> titles = ["Home", "Report", "Profile"];
  List<IconData> icons = [
    Icons.home_filled,
    Icons.insert_chart,
    Icons.person,
  ];
}