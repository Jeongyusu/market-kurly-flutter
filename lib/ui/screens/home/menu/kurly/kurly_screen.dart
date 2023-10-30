import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/widget/home_kurly_menu_title.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_star_icon.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_grid.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_hoziontal_list.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_item.dart';

class KurlyScreen extends StatefulWidget {
  @override
  State<KurlyScreen> createState() => _KurlyScreenState();
}

class _KurlyScreenState extends State<KurlyScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final SwiperController _swiperController = SwiperController();

  bool isSelected = false;

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1), // 애니메이션 지속 시간을 설정할 수 있습니다.
      curve: Curves.ease, // 애니메이션 커브를 선택할 수 있습니다.
    );
  }

  final List<String> imagePaths = [
    'assets/images/banner01.jpg',
    'assets/images/banner02.jpg',
    'assets/images/banner03.jpg',
    'assets/images/banner04.jpg',
  ];

  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 280.0,
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            stretch: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Swiper(
                controller: _swiperController,
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                },
                autoplay: true,
                autoplayDelay: 3000,
              ),
            ),
          ),
          HomeKurlyMenuTitle(title: "지금 가장 핫한 상품"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CustomProductHorizontalList(images: images),
            ),
          ),
          HomeKurlyMenuTitle(title: "초특가 반값 SALE"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CustomProductHorizontalList(images: images),
            ),
          ),
          HomeKurlyMenuTitle(title: "MD추천"),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: CustomProductGrid(images: images),
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
      ),
      floatingActionButton: _buildTopButton(),
    );
  }

  // 컬리추천 메인 슬라이드
  Widget _mainSlider(int index) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 11,
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 30.0,
          left: 155.0,
          child: IconButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
              Color iconColors = isSelected ? basicColorW : primaryColor;
              _swiperController.previous();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: basicColorW,
            ),
          ),
        ),
        Positioned(
          bottom: 30.0,
          right: 150.0,
          child: IconButton(
            onPressed: () {
              _swiperController.next();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: basicColorW,
            ),
          ),
        )
      ],
    );
  }

  // 탑버튼
  Widget _buildTopButton() {
    return FloatingActionButton(
      onPressed: () {
        _scrollToTop();
      },
      backgroundColor: basicColorW,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: bgAndLineColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Icon(
        Icons.arrow_upward,
        color: primaryColor,
      ),
    );
  }
}
