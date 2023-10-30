import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_cart_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';

class CustomProductGrid extends StatelessWidget {
  const CustomProductGrid({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8), // 이미지와 아래 내용 사이의 간격 조절
                CustomCartButton(),
                SizedBox(
                  height: xsmallGap,
                ),
                Container(
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
                SizedBox(
                  height: xsmallGap,
                ),
                Text(
                  "2000원",
                  style: disabledText(),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "20%",
                        style: discountText(),
                      ),
                      WidgetSpan(
                        child: SizedBox(width: smallGap),
                      ),
                      TextSpan(
                        text: "1700원~",
                        style: subTitleReqular(),
                      ),
                    ],
                  ),
                ),
                CustomReviewIcon(),
              ],
            ),
          );
        },
        childCount: 4,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        crossAxisSpacing: 12,
        childAspectRatio: 0.41,
      ),
    );
  }
}
