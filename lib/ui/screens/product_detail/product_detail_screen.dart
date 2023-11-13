import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_detail_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_info/product_info_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/product_inquiry_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_tabbar.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_bottom_sheet.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends StatefulWidget {
  final TabController? _tabController;
  final int productId;
  const ProductDetailScreen({
    super.key,
    required TabController? tabController,
    required this.productId,
  }) : _tabController = tabController;

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
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ProductDescriptionModel? model =
            ref.watch(productDescriptionProvider(widget.productId));
        if (model == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          ProductDescriptionDTO? productDetail = model.productDescriptionDTO;
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  CustomNavAppBar(
                    text: productDetail.productName,
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
                        ProductDescriptionScreen(
                          productId: widget.productId,
                        ),
                        ProductInfoScreen(),
                        ProductReviewScreen(),
                        ProductInquiryScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: ProductDetailBottomSheet(
                funPageRoute: () {}, text: "구매하기", productId: widget.productId),
          );
        }
      },
    );
  }
}
