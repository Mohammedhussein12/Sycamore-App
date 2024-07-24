import 'package:flutter/material.dart';

import '../constants.dart';

class WarningRichText extends StatelessWidget {
  const WarningRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: const [
          TextSpan(
            text: 'In case ',
            style: TextStyle(
                fontSize: 25,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'you feel any of the following symptoms:',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
