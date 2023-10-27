import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/custom_star_icon.dart';

class CustomReviewIcon extends StatelessWidget {
  const CustomReviewIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomStarIcon(),
        CustomStarIcon(),
        CustomStarIcon(),
        CustomStarIcon(),
      ],
    );
  }
}
