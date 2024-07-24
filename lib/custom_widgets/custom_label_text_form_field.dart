import 'package:flutter/material.dart';
class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.text, this.fontSize = 20,
  });
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: const Color(0xff030303).withOpacity(0.58),
          fontFamily: 'Poppins'),
    );
  }
}
