import 'package:flutter/material.dart';
import '../constants.dart';

class PatientLogoutButton extends StatelessWidget {
  const PatientLogoutButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 65),
          backgroundColor: kPrimaryColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
        child: const ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            textAlign: TextAlign.center,
            'Logout',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
