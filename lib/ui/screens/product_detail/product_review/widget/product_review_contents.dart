import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_area.dart';

class ProductReviewContents extends StatelessWidget {
  const ProductReviewContents({
    super.key,
    this.contents,
  });

  final contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "후기 내용",
            style: subTitleSmall(),
          ),
          Container(
            height: 160,
            child: CustomTextArea(
              hintText: "문의하실 내용을 입력해주세요. (0/5,000)",
              funValidator: validateContent(),
              contents: contents,
            ),
          ),
        ],
      ),
    );
  }
}
