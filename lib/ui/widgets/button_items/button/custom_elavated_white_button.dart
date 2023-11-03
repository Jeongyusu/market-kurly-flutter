import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomElevatedWhiteButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const CustomElevatedWhiteButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: basicColorW,
        side: BorderSide(
          color: basicColorB9, // 회색 테두리선의 색상을 지정하세요
          width: 0.5, // 테두리선의 두께를 조절하세요
        ),
        elevation: 0.0
      ),
      onPressed: funPageRoute,
      child: Text("$text", style: TextStyle(color: basicColorB1),),
    );
  }
}
