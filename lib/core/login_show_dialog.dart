import 'package:flutter/material.dart';
import 'package:sycamore_project/screens/doctor_login_screen.dart';
import 'package:sycamore_project/screens/patient_login_screen.dart';

import '../constants.dart';

void showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'login as',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DoctorLoginScreen()));
                },
                child: Container(
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xff199A8E).withOpacity(.8),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Center(
                    child: Text(
                      'Doctor',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PatientLoginScreen()));
                },
                child: Container(
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Center(
                    child: Text(
                      'Patient',
                      style: TextStyle(
                          color: const Color(0xff199A8E).withOpacity(.9),
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      );
    },
  );
}
