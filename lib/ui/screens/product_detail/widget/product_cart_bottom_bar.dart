import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_cart_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCartBottomBar extends StatelessWidget {
  const ProductCartBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: basicColorW,
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            builder: (BuildContext context) {
              return ProductCartBottomSheet();
            },
          );
        },
        child: Text(
          "장바구니 담기",
        ),
      ),
    );
  }
}
