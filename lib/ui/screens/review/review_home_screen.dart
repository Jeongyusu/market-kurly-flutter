import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_area.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_product_second.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/custom_main_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_review_home_appbar.dart';

import 'widget/review_home_order_number.dart';
import 'widget/review_home_product.dart';

class ReviewHomeScreen extends StatefulWidget {
  const ReviewHomeScreen({super.key});

  @override
  State<ReviewHomeScreen> createState() => _ReviewHomeScreenState();
}

class _ReviewHomeScreenState extends State<ReviewHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomReviewHomeAppbar(
            title: Text(
          "상품 후기",
          style: subTitleBold(),
        )),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text("작성가능 후기(0)", style: tabBarTitle()),
                ),
                Tab(
                  child: Text("작성완료 후기(0)", style: tabBarTitle()),
                ),
              ],
              indicatorColor: primaryColor, // 선택된 탭 아래의 선 색상
              labelColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              // 인디캐이터의 패딩
              indicatorPadding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ReviewHomeOrderNumber(),
                          ReviewHomeProduct(bottomRightText: "7일 남음", bottomRightTextStyle: reviewDeadLine()),
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ReviewHomeOrderNumber(),
                          ReviewHomeProductSecond(bottomRightText: "2023-10-14 작성", bottomRightTextStyle: basicTextSmall()),
                        ],
                      );
                    },
                  ),

                  // Image.asset(
                  //   'assets/images/product01.png',
                  //   width: 30,
                  //   height: 30,
                  // ),
                  // Image.asset(
                  //   'assets/images/product01.jpg',
                  //   width: 30,
                  //   height: 30,
                  // )
                ],
              ),
            )
          ],
        ));
  }
}
