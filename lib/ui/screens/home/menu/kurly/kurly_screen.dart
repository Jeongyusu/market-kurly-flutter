import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/widget/home_kurly_menu_title.dart';
import 'package:flutter_blog/ui/widgets/custom_star_icon.dart';
import 'package:flutter_blog/ui/widgets/icons/custom_review_icon.dart';

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
    'assets/images/banner_01.png',
    'assets/images/banner_02.png',
    'assets/images/banner_03.png',
    'assets/images/banner_04.png',
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
            expandedHeight: 300.0,
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
                            Color iconColors =
                                isSelected ? basicColorW : primaryColor;
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
                },
                autoplay: true,
                autoplayDelay: 3000,
              ),
            ),
          ),
          HomeKurlyMenuTitle(title: "지금 가장 핫한 상품"),
          CustomProductItem(images: images),
          HomeKurlyMenuTitle(title: "초특가 반값 SALE"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: largeGap),
              child: SizedBox(
                height: 355,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  width: 145, // 아이콘의 크기를 설정합니다.
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: basicColorB9, // 테두리의 색상을 설정합니다.
                                      width: 1, // 테두리의 두께를 설정합니다.
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ), // 가로 세로 크기를 동일하게 설정하거나 필요에 따라 다르게 설정할 수 있습니다.
                                  child: InkWell(
                                    onTap: () {
                                      // 아이콘이 클릭되었을 때의 동작을 정의합니다.
                                    },
                                    child: Icon(
                                      Icons.shopping_cart, // 원하는 아이콘을 선택합니다.
                                      size: 16, // 아이콘의 크기를 설정합니다.
                                      color: basicColorB3, // 아이콘의 색상을 설정합니다.
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "판매자",
                                        style: basicText(),
                                      ),
                                      WidgetSpan(
                                        child: SizedBox(width: smallGap),
                                      ),
                                      TextSpan(
                                        text: "제목제목제목제목제목제목제목제목제목제목제목제목제목",
                                        style: basicText(),
                                      ),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                "2000원",
                                style: disabledText(),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "20%",
                                      style: discountText(),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(width: smallGap),
                                    ),
                                    TextSpan(
                                      text: "1700원~",
                                      style: subTitleReqular(),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  CustomStarIcon(),
                                  CustomStarIcon(),
                                  CustomStarIcon(),
                                  CustomStarIcon(),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          HomeKurlyMenuTitle(title: "MD추천"),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: 145, // 아이콘의 크기를 설정합니다.
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: basicColorB9, // 테두리의 색상을 설정합니다.
                              width: 1, // 테두리의 두께를 설정합니다.
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ), // 가로 세로 크기를 동일하게 설정하거나 필요에 따라 다르게 설정할 수 있습니다.
                          child: InkWell(
                            onTap: () {
                              // 아이콘이 클릭되었을 때의 동작을 정의합니다.
                            },
                            child: Icon(
                              Icons.shopping_cart, // 원하는 아이콘을 선택합니다.
                              size: 16, // 아이콘의 크기를 설정합니다.
                              color: basicColorB3, // 아이콘의 색상을 설정합니다.
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "판매자",
                                    style: basicText(),
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(width: smallGap),
                                  ),
                                  TextSpan(
                                    text: "제목제목제목제목제목제목제목제목제목제목제목제목제목",
                                    style: basicText(),
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            "2000원",
                            style: disabledText(),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "20%",
                                  style: discountText(),
                                ),
                                WidgetSpan(
                                  child: SizedBox(width: smallGap),
                                ),
                                TextSpan(
                                  text: "1700원",
                                  style: subTitleReqular(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomStarIcon(),
                          CustomStarIcon(),
                          CustomStarIcon(),
                          CustomStarIcon(),
                        ],
                      )
                    ],
                  );
                },
                childCount: images.length,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 30.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.6,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollToTop();
        },
        backgroundColor: basicColorW,
        shape: RoundedRectangleBorder(
          // 테두리 모양 설정
          side: BorderSide(
            color: bgAndLineColor, // 원하는 테두리 색상 설정
            width: 1.0, // 테두리 두께 설정
          ),
          borderRadius: BorderRadius.circular(50.0), // 원형 모양
        ),
        child: Icon(
          Icons.arrow_upward,
          color: primaryColor,
        ),
      ),
    );
  }
}

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: largeGap),
        child: SizedBox(
          height: 355,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: 145, // 아이콘의 크기를 설정합니다.
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: basicColorB9, // 테두리의 색상을 설정합니다.
                                width: 1, // 테두리의 두께를 설정합니다.
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ), // 가로 세로 크기를 동일하게 설정하거나 필요에 따라 다르게 설정할 수 있습니다.
                            child: InkWell(
                              onTap: () {
                                // 아이콘이 클릭되었을 때의 동작을 정의합니다.
                              },
                              child: Icon(
                                Icons.shopping_cart, // 원하는 아이콘을 선택합니다.
                                size: 16, // 아이콘의 크기를 설정합니다.
                                color: basicColorB3, // 아이콘의 색상을 설정합니다.
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "판매자",
                                  style: basicText(),
                                ),
                                WidgetSpan(
                                  child: SizedBox(width: smallGap),
                                ),
                                TextSpan(
                                  text: "제목제목제목제목제목제목제목제목제목제목제목제목제목",
                                  style: basicText(),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "2000원",
                          style: disabledText(),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "20%",
                                style: discountText(),
                              ),
                              WidgetSpan(
                                child: SizedBox(width: smallGap),
                              ),
                              TextSpan(
                                text: "1700원~",
                                style: subTitleReqular(),
                              ),
                            ],
                          ),
                        ),
                        CustomReviewIcon()
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
