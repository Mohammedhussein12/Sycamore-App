import 'package:flutter/material.dart';
import 'package:sycamore_project/screens/on_boarding_screen.dart';
import '../core/helper_methods.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      navigateTo(page:  const OnBoardingScreen(), withHistory: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff1D938F),
              Color(0xffB7D4C5),
              Color(0xffCDE0D6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "assets/images/llogo team' 1.png",
              width: 250,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
