import 'package:flutter/material.dart';


class CustomListItem extends StatelessWidget {
  final String title;
  final String value;

  const CustomListItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Alice',
                  color: Color(0xff76BCBA),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xff8E8E93),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  fontFamily: 'Poppins'
                ),
              ),
            ],
          ),
          const Divider(thickness: 1,),
        ],
      ),
    );
  }
}
