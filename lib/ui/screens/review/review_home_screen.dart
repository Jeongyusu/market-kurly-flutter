import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/review/body/review_home_screen_body.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_product_second.dart';
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
    return ReviewHomeScreenBody(tabController: _tabController);
  }
}

