import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStarIcon extends StatelessWidget {
  const CustomStarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      child: Image.asset(
        "assets/images/star_icon.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
