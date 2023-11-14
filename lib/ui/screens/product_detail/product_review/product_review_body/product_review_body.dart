import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/model/review.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';

import '../../../../../_core/constants/font.dart';
import '../../../../widgets/icons_and_images/custom_review_icon.dart';
import '../widget/product_review_img_list.dart';

class ProductReviewBody extends StatelessWidget {
  final double? reviewGrade;
  const ProductReviewBody({
    super.key,
    required this.formattedDate,
    this.reviewGrade,
  });

  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding:
              EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 4.0),
          sliver: SliverToBoxAdapter(
            child: CustomTextButton(
              "후기 쓰기",
              () {
                Navigator.pushNamed(context, Move.productReviewSaveScreen);
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(12.0),
          sliver: SliverList.builder(
            itemCount: reviewData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: smallGap),
                decoration: BoxDecoration(
                  color: basicColorW,
                  border: Border(
                    bottom: BorderSide(
                      color: bgAndLineColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextItem(
                                text: "${reviewData[index].username}",
                                style: subTitleSmall(),
                                subtext: '${reviewData[index].productName}',
                                subStyle: reviewTitle(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Container(
                                  width: 320,
                                  child: Text(
                                    "${reviewData[index].reviewContent}",
                                    style: basicTextSmall(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: ProductReviewImgList(
                          images: reviewData[index].reviewPics,
                        ),
                      ),
                      SizedBox(
                        height: xsmallGap,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          formattedDate,
                          style: subContents(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
