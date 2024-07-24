import 'package:flutter/material.dart';
import '../controllers/nutrition_tips_controller.dart';
import '../screens/nutrition_tips_for_patient_health_screen.dart';
import '../screens/patient_breathing_exercises_screen.dart';

class TipsForPatientHealthScreenTabBar extends StatefulWidget {
  const TipsForPatientHealthScreenTabBar({super.key});

  @override
  State<TipsForPatientHealthScreenTabBar> createState() =>
      _TipsForPatientHealthScreenTabBarState();
}

class _TipsForPatientHealthScreenTabBarState
    extends State<TipsForPatientHealthScreenTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          NutritionTipsForPatientHealth(controller: NutritionTipsController()),
          const PatientBreathingExercisesScreen()
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          controller: tabController,
          indicatorColor: const Color(0xff359E98),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          labelColor: const Color(0xff359E98),
          tabs: const [
            Tab(
              text: 'Nutrition Tips',
            ),
            Tab(
              text: 'Breathing Tips',
            ),
          ],
        ),
      ),
    );
  }
}