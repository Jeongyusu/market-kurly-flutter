import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_bottom_sheet_item.dart';

class CustomCartButton extends StatelessWidget {
  final productId;
  const CustomCartButton({super.key, this.productId});

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
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return ProductBottomSheetItem(productId: productId);
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
