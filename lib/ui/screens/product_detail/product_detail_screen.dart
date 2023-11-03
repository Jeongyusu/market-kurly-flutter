import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_info/product_info_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/product_inquiry_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_tabbar.dart';
import 'package:flutter_blog/ui/widgets/product_detail_bottombar.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required TabController? tabController})
      : _tabController = tabController;
  final TabController? _tabController;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  TabController? _tabController;

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomNavAppBar(
              text: "[귤림원] 새콤달콤 제주 하우스 감귤ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: ProductDetailTabBar(_tabController!),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ProductDescriptionScreen(),
                  ProductInfoScreen(),
                  ProductReviewScreen(),
                  ProductInquiryScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          ProductDetailBottomSheet(funPageRoute: () {}, text: "구매하기"),
    );
  }
}