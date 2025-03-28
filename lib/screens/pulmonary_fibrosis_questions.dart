import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/controllers/questions_controller.dart';
import 'package:sycamore_project/screens/third_register_screen.dart';
import '../core/helper_methods.dart';
import '../localization_service/localization_service.dart';

class PulmonaryFibrosisQuestions extends StatefulWidget {
  const PulmonaryFibrosisQuestions({Key? key}) : super(key: key);

  @override
  State<PulmonaryFibrosisQuestions> createState() => _PulmonaryFibrosisQuestionsState();
}

class _PulmonaryFibrosisQuestionsState extends State<PulmonaryFibrosisQuestions> {
  final controller = QuestionsController();
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          controller.currentPage = value;
          setState(() {});
        },
        children: List.generate(
          controller.pulmonaryFibrosisQuestions.length,
              (index) => SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'To complete your register\n please answer these\n questions',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      controller.pulmonaryFibrosisQuestions.length,
                          (index) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: Container(
                          width: 15,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: index == controller.currentPage
                                ? const Color(0xff359E98)
                                : const Color(0xffD9D9D9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    LocalizationService.of(context).translate(
                        controller.pulmonaryFibrosisQuestions[controller.currentPage].question
                    )!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Alice",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff777777),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      yesNoButton('Yes'),
                      yesNoButton('No')
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container yesNoButton(String answer) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff777777),
        ),
      ),
      width: 90,
      height: 50,
      child: TextButton(
        onPressed: () {
          setState(() {
            String currentQuestion = controller.pulmonaryFibrosisQuestions[
            controller.currentPage
            ].question;
            kPulmonaryFibrosisAnswers[currentQuestion] = answer;

            if (answer == 'Yes') {
              String translatedQuestion = LocalizationService.of(context)
                  .translate(currentQuestion)!;
              kPulmonaryFibrosisYesAnswers.add(translatedQuestion);
            }

            if (controller.currentPage < controller.pulmonaryFibrosisQuestions.length - 1) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              navigateTo(page: const ThirdRegisterScreen(), withHistory: false);
            }
          });
        },
        child: Text(
          answer,
          style: const TextStyle(
            color: Color(0xff777777),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

