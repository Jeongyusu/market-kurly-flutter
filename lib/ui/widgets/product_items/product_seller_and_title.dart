import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class ProductSellerAndTitle extends StatelessWidget {
  const ProductSellerAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: double.infinity,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "판매자",
                style: basicText(),
              ),
              WidgetSpan(
                child: SizedBox(width: smallGap),
              ),
              TextSpan(
                text: "제목제목제목제목제목제목제목제목제목제목제목제목제목",
                style: basicText(),
              ),
            ],
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }
}
