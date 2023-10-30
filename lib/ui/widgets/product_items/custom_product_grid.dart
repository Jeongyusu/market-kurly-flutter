import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 145,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: basicColorB9,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.shopping_cart,
                      size: 16,
                      color: basicColorB3,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                          text: "1700원",
                          style: subTitleReqular(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomReviewIcon(),
            ],
          );
        },
        childCount: images.length,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
    );
  }
}
