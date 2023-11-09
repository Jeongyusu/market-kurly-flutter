import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/repository/coupon_repository.dart';
import 'package:flutter_blog/ui/screens/coupon/body/coupon_home_screen_body.dart';
import 'package:flutter_blog/ui/screens/coupon/coupon_view_model.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_bottom_appbar.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget/coupon_bottom_appbar.dart';

class MyInfoCouponHomeScreen extends ConsumerWidget {
  MyInfoCouponHomeScreen({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "쿠폰",
        style: subTitleBold(),
      )),
      body: CouponHomeScreenBody(),
      bottomNavigationBar: CouponBottomAppbar(
        text: "등록하기",
        funPageRoute: () {},
        controller: controller,
      ),
    );
  }
}
