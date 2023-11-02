import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';

class ProductInquiryScreen extends StatelessWidget {
  const ProductInquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTextButton(
        "상품 문의하기",
        () {
          Navigator.pushNamed(context, Move.joinScreen);
        },
      ),
    );
  }
}
