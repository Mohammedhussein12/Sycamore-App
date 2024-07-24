import 'package:flutter/material.dart';
import 'package:sycamore_project/constants.dart';

void sendNotificationShowDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          width: 300,
          height: 250,
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
              const Text(
                'Are you sure to send notification\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t to the doctor ?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kPrimaryColor),
                      child: const Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: const Center(
                        child: Text(
                          'No',
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
