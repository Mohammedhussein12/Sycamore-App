import 'package:flutter/material.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/screens/success_register_screen.dart';
import '../components/item_checkbox_second_register_screen.dart';
import '../custom_widgets/custom_button.dart';

class ThirdRegisterScreen extends StatelessWidget {
  const ThirdRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                textAlign: TextAlign.center,
                'To complete your register\nplease answer this\nquestions',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'Inter'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 380,
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Do you have any of the\n following chronic diseases?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1D938F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ItemCheckBoxRegisterScreen(text: 'Heart disease'),
                  const SizedBox(
                    height: 2,
                  ),
                  ItemCheckBoxRegisterScreen(text: 'Diabetes'),
                  const SizedBox(
                    height: 2,
                  ),
                  ItemCheckBoxRegisterScreen(text: 'Hypertension'),
                  const SizedBox(
                    height: 2,
                  ),
                  ItemCheckBoxRegisterScreen(text: 'Hepatitis c '),
                  const SizedBox(
                    height: 2,
                  ),
                  ItemCheckBoxRegisterScreen(text: 'Hepatitis B'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Next',
                onTap: () {
                  navigateTo(
                      page: const SuccessRegisterScreen(
                          selectedUserType: 'patient'),
                      withHistory: true);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
