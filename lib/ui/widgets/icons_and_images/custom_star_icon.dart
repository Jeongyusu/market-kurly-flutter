import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomStarIcon extends StatelessWidget {
  const CustomStarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: reviewColor,
      size: 16,
    );
  }
}
