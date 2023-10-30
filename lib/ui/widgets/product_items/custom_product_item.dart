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
                width: 145,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: basicColorB9,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  onTap: () {},
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
