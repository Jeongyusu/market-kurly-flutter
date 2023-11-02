import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("정유수", style: subTitleSmall()),
                    Text(
                      "새콤달콤 제주 하우스 감귤",
                      style: subContentsPointSmall(),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: CustomReviewIcon(),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
