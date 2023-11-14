import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_rating.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_camera_text_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProductReviewForm extends StatefulWidget {
  ProductReviewForm({Key? key}) : super(key: key);
  int starCount = 0;
  final formKey = GlobalKey<FormState>();
  final reviewContent = TextEditingController();
  final reviewPics = ValueNotifier<List<String>>([]);

  void submit(WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      Logger().d("여기는 form 위젯 계층이에요 + ${reviewPics.value.length}");

      List<ReviewBase>? reviewBaseList =
          reviewPics.value?.map((pic) => ReviewBase(reviewBase: pic)).toList();
      ProductReviewSaveDTO proReqDTO = ProductReviewSaveDTO(
        reviewContent: reviewContent.text,
        reviewPics: reviewBaseList,
        starCount: starCount,
      );
    }
  }

  @override
  _ProductReviewFormState createState() => _ProductReviewFormState(
        reviewContent: reviewContent,
        reviewPics: reviewPics,
        starCount: starCount,
      );
}

class _ProductReviewFormState extends State<ProductReviewForm> {
  late TextEditingController reviewContent;
  late ValueNotifier<List<String>> reviewPics;
  late int starCount;

  // 생성자 수정
  _ProductReviewFormState({
    required TextEditingController reviewContent,
    required ValueNotifier<List<String>> reviewPics,
    required int starCount,
  }) {
    this.reviewContent = reviewContent;
    this.reviewPics = reviewPics;
    this.starCount = starCount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            ProductReviewRating(
              starCount: (value) {
                setState(() {
                  widget.starCount = value;
                });
                print("${starCount} 상위위젯");
              },
            ),
            // TODO - 여기 수정 widget.reviewContent
            ProductReviewContents(contents: widget.reviewContent),
            SizedBox(
              height: smallGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCameraTextArea(photoList: widget.reviewPics),
              ],
            )
          ],
        ),
      ),
    );
  }
}
