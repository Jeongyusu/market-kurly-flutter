import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class MyInfoCoupon extends StatelessWidget {
  const MyInfoCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              "보유 쿠폰 2장",
              style: basicText(),
            )),
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 25),
          alignment: Alignment.topLeft,
          child: Text(
            "2만원 이상 무료배송",
            style: basicText(),
          ),
        )
      ],
    );
  }
}
