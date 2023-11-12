import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_list_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_star_half_icon.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_star_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomReviewIcon extends StatelessWidget {
  final double? totalReviewGrade;
  final int? index;

  CustomReviewIcon({
    this.totalReviewGrade,
    this.index,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> reviewIcons = [];
    for (int i = 0; i < totalReviewGrade!.toInt(); i++) {
      reviewIcons.add(CustomStarIcon());
    }

    if (totalReviewGrade! % 1 == 0.5) {
      reviewIcons.add(CustomStarHalfIcon());
    }
    return Row(
      children: reviewIcons,
    );
  }
}
