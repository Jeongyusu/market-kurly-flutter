import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';

import '../../../../../_core/constants/font.dart';
import '../../../../widgets/icons_and_images/custom_review_icon.dart';
import '../widget/product_review_img_list.dart';

class ProductReviewBody extends StatelessWidget {
  const ProductReviewBody({
    super.key,
    required this.formattedDate,
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
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
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
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/user_img_01.png",
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextItem(
                                text: "서태웅",
                                style: subTitleSmall(),
                                subtext: '새콤달콤 제주 하우스 감귤',
                                subStyle: reviewTitle(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: CustomReviewIcon(),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: ProductReviewImgList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "★ 내 돈 내 산 찐 후기★\n"
                          "아이스 아메리카노를 즐겨먹어서 주기적으로 캡슐이 떨어질 때마다 구매하고\n"
                          "있어요 : ) 이번에도 떨어질뜸 되어 재구매하게 되었습니다!!!\n"
                          "일리커피 가성비 최고입니다~!~!",
                          style: basicTextSmall(),
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
