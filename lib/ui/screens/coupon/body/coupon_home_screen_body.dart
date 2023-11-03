import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CouponHomeScreenBody extends StatelessWidget {
  const CouponHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 10 ,itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(width: 0.5, color: basicColorB7),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("컬리멤버스 쿠폰팩", style: couponTitle(),),
              Text("최대 24,000원 할인"),
              Text("무료배송 1장, 5,000원 할인 1장, 3,000원 할인 2장"),
            ],
          ),
        ),
      );
    },);
  }
}
