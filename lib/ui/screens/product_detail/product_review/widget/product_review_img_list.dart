import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/review.dart';

class ProductReviewImgList extends StatelessWidget {
  final List<ReviewBase>? images;

  ProductReviewImgList({
    Key? key,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 이미지가 존재하고 리스트가 비어 있지 않으면 이미지를 표시합니다.
        if (images != null && images!.isNotEmpty)
          for (ReviewBase image in images!)
            Image.asset(
              image.url,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
      ],
    );
  }
}
