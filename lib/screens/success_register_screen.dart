import 'package:flutter/material.dart';
import 'package:sycamore_project/core/helper_methods.dart';
import 'package:sycamore_project/custom_widgets/custom_button.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({super.key, required this.selectedUserType});
  final String selectedUserType;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/images/success_register.png",
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '\t\t\t\tyou have\n successfully\n\t\t registered',
              style: TextStyle(
                shadows: const [
                  BoxShadow(
                      blurRadius: 4,
                    offset: Offset(2,4),
                    color: Color(0xffBFDCCD)
                  ),
                ],
                fontFamily: "Alice",
                fontWeight: FontWeight.w400,
                fontSize: 35,
                color: const Color(0xff030303).withOpacity(.58),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              borderRadius: 32,
              text: 'confirm',
              onTap: () {
                navigateToHomePage(selectedUserType);
              },
            )
          ],
        ),
      ),
    );
  }
}
