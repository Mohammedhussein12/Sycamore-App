import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.contentPadding,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onFieldSubmitted,
  });

  final String? hintText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field Is Required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xffB2B2B2),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffB2B2B2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: const Color(0xff323232).withOpacity(.65),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xff323232).withOpacity(.65),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xff323232).withOpacity(.65),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xff323232).withOpacity(.65),
          ),
        ),
      ),
    );
  }
}
