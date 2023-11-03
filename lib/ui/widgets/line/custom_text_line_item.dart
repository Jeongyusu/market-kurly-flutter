import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomTextLineItem extends StatelessWidget {
  const CustomTextLineItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: formColor,
              width: 1.0,
            ),
          ),
        ),
        height: 14.0,
      ),
    );
  }
}
