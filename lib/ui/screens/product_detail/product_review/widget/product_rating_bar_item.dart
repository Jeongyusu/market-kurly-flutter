import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingBarItem extends StatelessWidget {
  const ProductRatingBarItem({
    super.key,
  });

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
        color: reviewColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
