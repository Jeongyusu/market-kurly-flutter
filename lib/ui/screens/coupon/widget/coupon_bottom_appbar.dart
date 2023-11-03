import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_text_form_field.dart';
import 'package:flutter_blog/ui/screens/coupon/widget/coupon_text_form_field.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_white_button.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_form_field.dart';

class CouponBottomAppbar extends StatelessWidget {
  final String text;
  final Function? funPageRoute;
  final TextEditingController controller;
  final funValidator;

  CouponBottomAppbar({
    Key? key,
    required this.text,
    this.funPageRoute, required this.controller, this.funValidator
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
          onPressed: (){
            couponShowDialog(context);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(50),
            backgroundColor: primaryColor,
          ),
          child: Text("$text"),
        ),
      ),
    );
  }

  void couponShowDialog(BuildContext context) {
    showDialog(context: context, barrierDismissible: true, builder: (context) {
      return AlertDialog(title: Text("쿠폰 등록"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          CouponTextFormField(placeholderText: "발급된 쿠폰번호를 입력해주세요", funValidator: funValidator, controller: controller),
            SizedBox(height: 10,),
            Text("쿠폰에 하이픈 '-'이 포함되어 있을 경우, 하이픈 '-'을 반드시 입력해주세요", style: subContents(),)
      ],),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                child: Expanded(child: CustomElevatedWhiteButton(text: "취소",funPageRoute: (){
                  Navigator.of(context).pop(); //창 닫기
                })),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  child: CustomElevatedButton(text: "확인", funPageRoute: (){
                  }),
                ),
              ),
            ],
          ),
        ),
        ]
      ,);
    });
  }
}