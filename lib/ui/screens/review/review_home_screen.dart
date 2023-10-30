import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_area.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_price_area.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/custom_main_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';

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
        appBar: CustomMainAppbar(title: Text("상품후기")),
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
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            color: Colors.yellow,
                            child: Text("나나나"),
                          )
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
