import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingBarItem extends StatelessWidget {
  final ValueChanged<int>? starCount;

  const ProductRatingBarItem({
    Key? key,
    this.starCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (double rating) {
        // 클릭한 별점을 int로 변환하여 starCount 함수 호출
        starCount?.call(rating.toInt());
        print(rating);
      },
    );
  }
}
