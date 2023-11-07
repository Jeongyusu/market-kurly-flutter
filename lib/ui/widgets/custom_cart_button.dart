import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_cart_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: formColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 16,
              color: basicColorB3,
            ),
            SizedBox(
              width: xsmallGap,
            ),
            Text(
              "담기",
              style: basicTextSmall(),
            ),
          ],
        ),
      ),
    );
  }
}
