import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStarHalfIcon extends StatelessWidget {
  const CustomStarHalfIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      child: Image.asset(
        "assets/images/star_half_icon.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
