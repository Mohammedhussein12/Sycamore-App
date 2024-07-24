import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpPinTextFormField extends StatelessWidget {
  const CustomOtpPinTextFormField({
    super.key, required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 35,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin1) {},
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff1D938F),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff1D938F),
            ),
          ),
        ),
        style: TextStyle(
            color: const Color(0xff030303).withOpacity(0.65),
            fontFamily: 'Poppins'),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}