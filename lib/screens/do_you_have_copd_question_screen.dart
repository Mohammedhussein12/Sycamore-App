import 'package:flutter/material.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/screens/copd_questions.dart';
import 'package:sycamore_project/screens/second_register_screen.dart';
import 'package:sycamore_project/screens/third_register_screen.dart';

import '../constants.dart';

class DoYouHaveCopdQuestionScreen extends StatefulWidget {
  const DoYouHaveCopdQuestionScreen({Key? key}) : super(key: key);

  @override
  State<DoYouHaveCopdQuestionScreen> createState() =>
      _DoYouHaveCopdQuestionScreenState();
}

class _DoYouHaveCopdQuestionScreenState
    extends State<DoYouHaveCopdQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'To complete your register\n please answer these\n questions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Do you have copd ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Alice",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [yesNoButton('yes'), yesNoButton('no')],
            ),
          ],
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
          )),
      width: 90,
      height: 50,
      child: TextButton(
        onPressed: () {
          if (answer == 'yes') {
            myChoise = 'copd';
            navigateTo(page: const COPDQuestions());
          } else if (answer == 'no') {
            navigateTo(page: const SecondRegisterScreen(), withHistory: true);
          }
        },
        child: Text(
          answer,
          style: const TextStyle(color: Color(0xff777777), fontSize: 20),
        ),
      ),
    );
  }
}
