import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/coupon/body/coupon_home_screen_body.dart';
import 'package:flutter_blog/ui/widgets/custom_simple_appbar.dart';

import 'widget/coupon_bottom_appbar.dart';

class CouponHomeScreen extends StatelessWidget {
  CouponHomeScreen({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(title: Text("쿠폰", style: subTitleBold(),)),
      body: CouponHomeScreenBody(),
      bottomNavigationBar: CouponBottomAppbar(text: "쿠폰 등록하기", controller: controller,),
    );
  }
}