import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';

class ProductDetailBottomBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomElevatedButton(
        text: "장바구니 담기",
        funPageRoute: () {},
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Maximum height of the header

  @override
  double get minExtent => 60.0; // Minimum height of the header

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
