import 'package:flutter/material.dart';
import 'package:sycamore_project/screens/language_screen.dart';
import '../components/patient_form_register.dart';
import '../constants.dart';

class FirstRegisterScreen extends StatelessWidget {
  const FirstRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(langNow,style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.white.withOpacity(0.4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) =>  LanguageScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: PatientFormRegister(),
      ),
    );
  }
}
