import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/custom_widgets/custom_button.dart';
import 'package:sycamore_project/screens/Otp_screen.dart';
import '../custom_widgets/custom_label_text_form_field.dart';
import '../custom_widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  'You forgot Your\n\t\t\t\t\t\t\t password',
                  style: TextStyle(
                      fontSize: 25,
                      color: const Color(0xff030303).withOpacity(0.65),
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'No worries enter your email bellow \n and we will send you a\t\t',
                        style: TextStyle(
                          color: const Color(0xff030303).withOpacity(0.65),
                        ),
                      ),
                      const TextSpan(
                        text: 'reset code',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              const CustomLabelText(text: 'email'),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: CustomTextFormField(
                  hintText: 'Drali200@gmail.com',
                  suffixIcon: Icon(
                    Icons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                  child: CustomButton(
                text: 'send reset code',
                onTap: () {
                  navigateTo(page: const OtpScreen(),withHistory: true);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
