import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_form.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_rating.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_camera_text_area.dart';

class ProductReviewSaveBody extends StatelessWidget {
  final TextEditingController? controller;
  ProductReviewSaveBody({
    super.key,
    required this.controller,
  });
  ProductReviewForm productReviewForm = new ProductReviewForm();

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
        SliverToBoxAdapter(child: productReviewForm),
      ],
    );
  }
}
