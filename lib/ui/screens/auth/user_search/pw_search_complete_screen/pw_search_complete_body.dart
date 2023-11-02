import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_svg_image.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';

class PwSearchCompleteBody extends StatelessWidget {
  const PwSearchCompleteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: largeGap),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSvgItem(
                svgImage: "pw_search_icon.svg",
              ),
              Text(
                "고객님의 비밀번호 찾기가 완료되었습니다. \n비밀번호를 재발급 받으세요!",
                style: subContentsPoint(),
              ),
              SizedBox(
                height: mediumGap,
              ),
              CustomTextItem(
                text: "비밀번호 : ",
                subtext: "zh *****",
                style: basicTextBig(),
                subStyle: basicTextBig(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
