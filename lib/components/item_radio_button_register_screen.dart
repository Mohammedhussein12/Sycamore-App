import 'package:flutter/material.dart';

class ItemRadioButtonRegisterScreen extends StatefulWidget {
  const ItemRadioButtonRegisterScreen({
    Key? key,
    required this.groupValue,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  final String groupValue;
  final ValueChanged<String?> onChanged;
  final String text;

  @override
  State<ItemRadioButtonRegisterScreen> createState() =>
      _ItemRadioButtonRegisterScreenState();
}

class _ItemRadioButtonRegisterScreenState
    extends State<ItemRadioButtonRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.groupValue == widget.text ? const Color(0xffD3E9E9)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: widget.groupValue == widget.text ?
          Colors.black.withOpacity(.3) : Colors.black.withOpacity(0))
      ),
      width: 350, height: 40,
      child: Row(
        children: [
          Radio<String?>(
            fillColor: MaterialStateProperty.all(
                widget.groupValue == widget.text ? Colors.blue : Colors.grey),
            overlayColor: MaterialStateProperty.all(Colors.blue),
            value: widget.text,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.black.withOpacity(.8),
                fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
