import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onTap,
      this.borderRadius = 25,
      this.width = 200,
      this.textFontSize = 20});

  final String text;
  final VoidCallback? onTap;
  final double borderRadius;
  final double width;
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xffB7D4C5),
              const Color(0xff1D938F).withOpacity(0.8),
              const Color(0xff1D938F).withOpacity(0.8),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                fontSize: textFontSize
            ),
          ),
        ),
      ),
    );
  }
}
