import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sycamore_project/screens/copd_questions.dart';
import 'package:sycamore_project/screens/do_you_have_copd_question_screen.dart';
import 'package:sycamore_project/screens/first_register_screen.dart';
import 'package:sycamore_project/screens/patient_signup_screen.dart';

import '../constants.dart';
import '../localization_service/localization_service.dart';

class LanguageScreen extends StatelessWidget {
   LanguageScreen({super.key});

  final localizationController = Get.find<LocalizationController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => PatientSignUpScreen()));
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Choose your language', style: TextStyle(
              color: kPrimaryColor, fontSize: 24),),
            const SizedBox(height: 10,),
            const Text('اختر لغتك', style: TextStyle(
              color: kPrimaryColor, fontSize: 24),),
            const SizedBox(height: 55,),

            Container(
              height: 40, width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey)
              ),
              child: TextButton(onPressed: (){
                langNow = 'en';
                localizationController.toggleLanguage();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const DoYouHaveCopdQuestionScreen()));
              }, child: const Text('English', style: TextStyle(
                color: kPrimaryColor
              ),),),
            ),
            const SizedBox(height: 25,),
            Container(
              height: 40, width: 200,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
                // border: Border.all(color: Colors.grey)
              ),
              child: TextButton(onPressed: (){
                langNow = 'ar';
                localizationController.toggleLanguage();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const DoYouHaveCopdQuestionScreen()));
              }, child: const Text('عربي', style: TextStyle(
                color: Colors.white
              ),),),
            )
          ],
        ),
      ),
    );
  }
}
