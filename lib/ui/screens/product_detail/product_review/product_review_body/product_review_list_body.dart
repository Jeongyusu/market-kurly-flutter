import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/data/model/review.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_screen.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';

import '../../../../../_core/constants/font.dart';
import '../../../../widgets/icons_and_images/custom_review_icon.dart';
import '../widget/product_review_img_list.dart';

class ProductReviewListBody extends StatelessWidget {
  final double? reviewGrade;
  ProductReviewListBody({
    super.key,
    required this.formattedDate,
    this.reviewGrade,
  });

  final String formattedDate;

  // ProductReviewDetailDTO productReviewList = ProductReviewDetailDTO();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "후기 목록",
          onPressed: () {
            Navigator.pushReplacementNamed(context, Move.productReviewScreen);
          },
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
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(right: 8.0, bottom: 8.0),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(40),
                          //     child: Image.asset(
                          //       "${reviewData[index].reviewPics}",
                          //       width: 60,
                          //       height: 60,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),

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
                                child: Text(
                                  "${reviewData[index].reviewContent}",
                                  style: basicTextSmall(),
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
