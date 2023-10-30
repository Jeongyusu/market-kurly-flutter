import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
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

  final List<String> categoryTitle = [
    '한식,양식 중식',
    '중식, 한식,양식 중식',
    '양식,한식,양식 중식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
    '양식',
  ];

  int selectedCategory = 0;

  void onCategorySelected(int categoryId) {
    print("Category $categoryId selected"); // 디버깅 메시지
    setState(() {
      selectedCategory = categoryId;
    });
  }

  final List<String> _valueList = <String>[
    "신상품순",
    "평점순",
    "판매량순",
    "마감인박순",
    "가격순"
  ];
  String _selectedValue = "신상품순";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: 40,
            title: Text('0'),
            pinned: true,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: basicColorW,
            titleSpacing: 0,
            flexibleSpace: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '총 34 개',
                      style: strongTextSmall(),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton2<String>(
                    value: _selectedValue,
                    style: TextStyle(),
                    alignment: Alignment.centerRight,
                    items: _valueList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            value,
                            style: basicTextSmall(),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value ?? "첫 번째";
                      });
                    },
                    underline: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                      ),
                    ),
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 90,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 18,
                      iconEnabledColor: basicColorB3,
                      iconDisabledColor: basicColorB9,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 8, right: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryTitle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                onCategorySelected(index);
                              });
                            },
                            style: TextButton.styleFrom(
                              elevation: 2,
                              backgroundColor: selectedCategory == index
                                  ? primaryColor02
                                  : basicColorW,
                              foregroundColor: selectedCategory == index
                                  ? basicColorW
                                  : basicColorB9,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                  color: selectedCategory == index
                                      ? primaryColor02
                                      : bgAndLineColor,
                                ),
                              ),
                              minimumSize: Size(0, 40),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4.0),
                              textStyle: TextStyle(
                                color: selectedCategory == index
                                    ? basicColorW
                                    : primaryColor,
                              ),
                            ),
                            child: Text("${categoryTitle[index]}"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: selectedCategory,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.4,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: basicColorB9,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 16,
                                    color: basicColorB3,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: xsmallGap,
                              ),
                              Container(
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
                              SizedBox(
                                height: xsmallGap,
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
                              CustomReviewIcon(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Center(child: Text("트렌드")),
                Center(child: Text("라이프")),
                Center(child: Text("힐링")),
                Center(child: Text("지적교양")),
                Center(child: Text("소설")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
