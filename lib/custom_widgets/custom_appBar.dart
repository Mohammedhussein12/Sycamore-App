import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.2),
      elevation: 0,
      centerTitle: true,
      title: Text(
        'sycamore',
        style: TextStyle(
            shadows: const [
              Shadow(
                blurRadius: 2,
                offset: Offset(0, 2),
                color: Color(0xffC9DED3),
              ),
            ],
            fontSize: 32,
            color: const Color(0xffA8D4D3).withOpacity(0.58),
            fontFamily: 'Inknut Antiqua'),
      ),
    );
  }
}
