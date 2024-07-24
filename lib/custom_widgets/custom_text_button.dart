import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.text, this.onPressed, required this.color});

  final String text;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: color
          ,
        ),
      ),
    );
  }
}
