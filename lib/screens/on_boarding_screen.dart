import 'package:flutter/material.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/custom_widgets/custom_text_button.dart';
import 'package:sycamore_project/screens/welcome_screen.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          controller.currentPage = value; // value رقم الصفحه الى انت روحتلها
          setState(() {});
        },
        children: List.generate(
          controller.models.length,
          (index) => SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: CustomTextButton(
                      onPressed: () {
                        navigateTo(
                            page: const WelcomeScreen(), withHistory: false);
                      },
                      text: "skip",
                      color: const Color(0xff323232).withOpacity(.59),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    controller.models[controller.currentPage].image!,
                    fit: BoxFit.fill,
                    width: 270,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    controller.models[controller.currentPage].title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      shadows: [
                        Shadow(
                            blurRadius: 4,
                          color: Color(0xff8ec1a6),
                          offset: Offset(2, 4),
                        ),
                      ],
                      fontFamily: "Alice",
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff777777),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    controller.models[controller.currentPage].subtitle ?? "",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff030303).withOpacity(0.58),
                    ),
                  ),
                  controller.models[controller.currentPage].subtitle == null
                      ? const SizedBox(
                          height: 40,
                        )
                      : const SizedBox(
                          height: 15,
                        ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      controller.models.length,
                      (index) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: index == controller.currentPage
                              ? const Color(0xff359E98)
                              : const Color(0xffD9D9D9),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
