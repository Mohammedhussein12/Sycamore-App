import 'package:flutter/material.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/custom_widgets/custom_button.dart';
import 'package:sycamore_project/screens/check_your_inbox_screen.dart';
import '../constants.dart';
import '../custom_widgets/custom_label_text_form_field.dart';
import '../custom_widgets/custom_otp_pin_text_form_field.dart';
import '../custom_widgets/custom_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios,
          color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'check your inbox',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: const Color(0xff030303).withOpacity(0.58),
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'A 6_digit confirmation code has \n\t\t\t\t\t\t\t\t\t\t\t\t been sent to your email',
                  style: TextStyle(
                      color: const Color(0xff030303).withOpacity(0.65),
                      fontSize: 15.0,
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomOtpPinTextFormField(hintText: '6'),
                    CustomOtpPinTextFormField(
                      hintText: '0',
                    ),
                    CustomOtpPinTextFormField(
                      hintText: '2',
                    ),
                    CustomOtpPinTextFormField(
                      hintText: '3',
                    ),
                    CustomOtpPinTextFormField(
                      hintText: '1',
                    ),
                    CustomOtpPinTextFormField(
                      hintText: '5',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const CustomLabelText(text: 'new password'),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: CustomTextFormField(
                  obscureText: true,
                  hintText: '••••••••••••••••••••',
                  suffixIcon: Icon(
                    Icons.lock,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 220,
                  child: CustomButton(textFontSize: 18,
                    text: 'change your password',
                    onTap: () {
                      navigateTo(page: const CheckYourInboxScreen(),withHistory: true);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'No code ?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'get another one',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
