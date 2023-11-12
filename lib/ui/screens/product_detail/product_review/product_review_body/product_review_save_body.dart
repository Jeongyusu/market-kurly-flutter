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
  // TODO - 필드값 선언해주고
  // TODO - 필드값 한곳에 모은다음에
  // TODO - 필드값을 디티오에 담은 후
  // TODO - 버튼에 ref 이용해서 담아온 디티오를 통신코드로 연결

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
