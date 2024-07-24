import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sycamore_project/doctor_bottom_navigation_bar/controller/bottom_navigation_bar_controller.dart';
import 'package:sycamore_project/screens/doctor_login_screen.dart';
import 'package:sycamore_project/screens/patient_login_screen.dart';
import 'package:sycamore_project/screens/pulmonary_embolism_questions.dart';
import 'package:sycamore_project/screens/pulmonary_fibrosis_questions.dart';
import '../patient_bottom_navigation_bar/controller/bottom_navigation_bar_controller.dart';
import '../screens/interstitial_lung_questions.dart';
import '../screens/pneumonia_questions.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void navigateTo({required Widget page, bool withHistory = false}) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory);
}

void navigateToHomePage(String userType) {
  if (userType == 'doctor') {
    navigateTo(page: const DoctorBottomNavController(), withHistory: false);
  } else if (userType == 'patient') {
    navigateTo(page: const PatientBottomNavController(), withHistory: false);
  }
}

void navigateToLoginPage(String userType) {
  if (userType == 'doctor') {
    navigateTo(page: DoctorLoginScreen(), withHistory: false);
  } else if (userType == 'patient') {
    navigateTo(page: PatientLoginScreen(), withHistory: false);
  }
}
void navigateToDiseaseQuestionsPage(String disease) {
  if (disease == 'Pulmonary fibrosis') {
    navigateTo(page: const PulmonaryFibrosisQuestions(), withHistory: true);
  } else if (disease == 'Pulmonary embolism') {
    navigateTo(page: const PulmonaryEmbolismQuestions(), withHistory: true);
  }
  else if (disease == 'Pneumonia') {
    navigateTo(page: const PneumoniaQuestions(), withHistory: true);
  }
  else if (disease == 'Interstitial lung disease') {
    navigateTo(page: const InterstitialLungQuestions(), withHistory: true);
  }
}
