import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class ReviewHomeElevatedButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const ReviewHomeElevatedButton(
      {required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        backgroundColor: primaryColor,
      ),
      onPressed: funPageRoute,
      child: Text("$text"),
    );
  }
}
