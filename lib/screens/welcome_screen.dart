import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';
import 'package:sycamore_project/core/login_show_dialog.dart';
import 'package:sycamore_project/core/sign_up_show_dialog.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80,),
          const Text('sycamore', style: TextStyle(
                shadows: [
                  Shadow(
                      blurRadius: 2,
                      offset: Offset(0, 4),
                      color: Color(0xffC9DED3)
                  )
                ],
                fontFamily: 'Inknut Antiqua',
                fontWeight: FontWeight.w400,
                fontSize: 32,
                color: Color(0xffA8D4D3)
            ),textAlign: TextAlign.center,),
          const Spacer(
            flex: 3,
          ),
          const Text(
            'Let’s get started!',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22,
            fontFamily: 'Inter'),
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              textAlign: TextAlign.center,
              'Login to enjoy the features we’ve\n provided, and stay healthy!',
              style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    offset: Offset(4, 4),
                    color: Color(0xffBFDCCD)
                  )
                ],
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
              fontFamily: 'Inter'),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () {
              showLoginDialog(context);
            },
            child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xff199A8E).withOpacity(.8),
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              showSignUpDialog(context);
            },
            child: Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: const Color(0xff199A8E).withOpacity(.9)
                      , fontSize: 20),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
