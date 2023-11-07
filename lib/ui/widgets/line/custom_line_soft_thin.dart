import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomLineSoftThin extends StatelessWidget {
  const CustomLineSoftThin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: formColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
