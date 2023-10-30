import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';

class CustomProductItem extends StatelessWidget {
  final int index;
  const CustomProductItem({
    super.key,
    required this.images,
    required this.index,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 145, // 아이콘의 크기를 설정합니다.
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: basicColorB9, // 테두리의 색상을 설정합니다.
                    width: 1, // 테두리의 두께를 설정합니다.
                  ),
                  borderRadius: BorderRadius.circular(5),
                ), // 가로 세로 크기를 동일하게 설정하거나 필요에 따라 다르게 설정할 수 있습니다.
                child: InkWell(
                  onTap: () {
                    // 아이콘이 클릭되었을 때의 동작을 정의합니다.
                  },
                  child: Icon(
                    Icons.shopping_cart, // 원하는 아이콘을 선택합니다.
                    size: 16, // 아이콘의 크기를 설정합니다.
                    color: basicColorB3, // 아이콘의 색상을 설정합니다.
                  ),
                ),
              ),
            ),
            Container(
              width: 150,
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
        )
      ],
    );
  }
}
