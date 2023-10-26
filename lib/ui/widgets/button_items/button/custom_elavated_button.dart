import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const CustomElevatedButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: primaryColor,
      ),
      onPressed: funPageRoute,
      child: Text("$text"),
    );
  }
}
