import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/review/body/review_home_screen_body.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_product_second.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_review_home_appbar.dart';

import 'widget/review_home_order_number.dart';
import 'widget/review_home_product.dart';

class MyInfoReviewHomeScreen extends StatefulWidget {
  const MyInfoReviewHomeScreen({super.key});

  @override
  State<MyInfoReviewHomeScreen> createState() => _MyInfoReviewHomeScreenState();
}

class _MyInfoReviewHomeScreenState extends State<MyInfoReviewHomeScreen>
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
    return ReviewHomeScreenBody(tabController: _tabController);
  }
}
