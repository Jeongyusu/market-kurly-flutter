import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/logo_bright.png",
          height: 200,
          width: 200,
        ),
        // Text(
        //   title,
        //   style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
