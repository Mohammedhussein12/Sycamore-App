import 'package:flutter/material.dart';
import 'package:sycamore_project/patient_const.dart';


class ItemCheckBoxRegisterScreen extends StatefulWidget {
  ItemCheckBoxRegisterScreen(
      {super.key, this.isChecked = false, required this.text});

  bool? isChecked;
  final String text;

  @override
  State<ItemCheckBoxRegisterScreen> createState() =>
      _ItemCheckBoxRegisterScreenState();
}

class _ItemCheckBoxRegisterScreenState
    extends State<ItemCheckBoxRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.isChecked! ? const Color(0xffD3E9E9) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: widget.isChecked! ?
          Colors.black.withOpacity(.3) : Colors.black.withOpacity(0))
      ),
      width: 375.74, height: 50,
      child: Row(
        children: [
          Checkbox(
            fillColor: MaterialStateProperty.all(Colors.white),
            checkColor: const Color(0xffD3E9E9),
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
                chronicDiseases.add(widget.text);
              });
            },
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.black.withOpacity(.8),
                fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}