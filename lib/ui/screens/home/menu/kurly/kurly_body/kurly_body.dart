import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/kurly_bottom_img.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/kurly_hot_product_list.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/kurly_recommend_product_list.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/widget/kurly_sale_product_list.dart';
import 'package:flutter_blog/ui/screens/home/widget/home_kurly_main_slider.dart';
import 'package:flutter_blog/ui/screens/home/widget/home_kurly_menu_title.dart';

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
        KurlyHotProductList(),
        HomeKurlyMenuTitle(title: "초특가 반값 SALE"),
        KurlySaleProductList(),
        HomeKurlyMenuTitle(title: "MD추천"),
        KurlyRecommendProductList(),
        KurlyBottomImg(),
      ],
    );
  }
}
