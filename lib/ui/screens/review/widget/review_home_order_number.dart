import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class ReviewHomeOrderNumber extends StatelessWidget {
  const ReviewHomeOrderNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: bgAndLineColor,
      padding: EdgeInsets.only(left: 20, top: 10),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            "주문번호 129319293",
            style: reviewOrderNumber(),
          ),
          SizedBox(
            width: 100,
          ),
        ],
      ),
    );
  }
}
