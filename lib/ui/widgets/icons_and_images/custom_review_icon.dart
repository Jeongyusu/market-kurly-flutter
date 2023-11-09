import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_star_half_icon.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_star_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomReviewIcon extends ConsumerWidget {
  final double? reviewGrade;
  const CustomReviewIcon({
    this.reviewGrade,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        CustomStarIcon(),
        CustomStarIcon(),
        CustomStarIcon(),
        CustomStarIcon(),
        CustomStarHalfIcon(),
      ],
    );
  }
}
