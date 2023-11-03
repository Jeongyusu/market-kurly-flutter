import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductInquiryContents extends StatelessWidget {
  const ProductInquiryContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/question_icon.svg",
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: smallGap,
              ),
              Container(
                width: 330,
                child: Text("배송누락이에용. 바로 처리 부탁드리겠습니다"),
              ),
            ],
          ),
          SizedBox(
            height: smallGap,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/answer_icon.svg",
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: xsmallGap,
              ),
              Container(
                width: 330,
                color: bgAndLineColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "안녕하세요 마켓컬리입니다. 불편을 드린점 깊이 사과드립니다",
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
