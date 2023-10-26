import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_svg_image.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';

class IdSearchCompleteBody extends StatelessWidget {
  const IdSearchCompleteBody({
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
                svgImage: "id_search_icon.svg",
              ),
              Text(
                "고객님의 \n아이디 찾기가 완료되었습니다.",
                style: subContentsPoint(),
              ),
              SizedBox(
                height: mediumGap,
              ),
              CustomTextItem(
                text: "아이디 : ",
                subtext: "gaml ***",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
