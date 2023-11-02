import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class ProductDetailTabBar extends SliverPersistentHeaderDelegate {
  final TabController _tabController;
  ProductDetailTabBar(this._tabController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: basicColorW,
      child: TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            child: Text("상품설명", style: TextStyle(fontSize: 16)),
          ),
          Tab(
            child: Text("상세정보", style: TextStyle(fontSize: 16)),
          ),
          Tab(
            child: Text("후기", style: TextStyle(fontSize: 16)),
          ),
          Tab(
            child: Text("상품문의", style: TextStyle(fontSize: 16)),
          ),
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        unselectedLabelColor: Colors.grey,
        labelColor: primaryColor,
        indicatorColor: primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
