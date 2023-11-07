import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_rating.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_camera_text_area.dart';

class ProductReviewSaveBody extends StatelessWidget {
  const ProductReviewSaveBody({
    super.key,
    required this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "후기 쓰기",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                ProductReviewRating(),
                ProductReviewContents(controller: controller),
                SizedBox(
                  height: smallGap,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCameraTextArea(),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
