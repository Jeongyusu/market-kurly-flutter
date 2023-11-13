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

      // 여기서 reviewContent, reviewPics, starCount 중 어떤 것이 null인지 확인
      ProductReviewSaveDTO proReqDTO = ProductReviewSaveDTO(
        reviewContent: reviewContent.text,
        reviewPics: reviewPics.value,
        starCount: starCount,
      );
    }
  }

  @override
  _ProductReviewFormState createState() => _ProductReviewFormState();
}

class _ProductReviewFormState extends State<ProductReviewForm> {
  int? starCount;
  final formKey = GlobalKey<FormState>();
  final reviewContent = TextEditingController();
  final reviewPics = ValueNotifier<List<String>>([]);

  void submit(WidgetRef ref) {
    if (formKey.currentState!.validate()) {
      Logger().d("여기는 form 위젯 계층이에요 + ${reviewPics.value.length}");

      ProductReviewSaveDTO proReqDTO = ProductReviewSaveDTO(
        reviewContent: reviewContent.text,
        reviewPics: reviewPics.value,
        starCount: starCount,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ProductReviewRating(
              starCount: (value) {
                setState(() {
                  starCount = value.toInt();
                });
                print("${starCount} 상위위젯");
              },
            ),
            ProductReviewContents(contents: reviewContent),
            SizedBox(
              height: smallGap,
            ),
            // ImageWidget(),
            // ImageUpload(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCameraTextArea(photoList: reviewPics),
              ],
            )
          ],
        ),
      ),
    );
  }
}
