import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/widget/home_kurly_main_slider.dart';
import 'package:flutter_blog/ui/screens/home/widget/home_kurly_menu_title.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_grid.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_hoziontal_list.dart';

class KurlyBody extends StatelessWidget {

  const KurlyBody({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        HomeKurlyMainSlider(),
        HomeKurlyMenuTitle(title: "지금 가장 핫한 상품"),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CustomProductHorizontalList(),
          ),
        ),
        HomeKurlyMenuTitle(title: "초특가 반값 SALE"),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CustomProductHorizontalList(),
          ),
        ),
        HomeKurlyMenuTitle(title: "MD추천"),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: CustomProductGrid(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: smallGap),
          sliver: SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 12 / 9,
              child: Image.asset(
                "assets/images/main_bottom_img.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
