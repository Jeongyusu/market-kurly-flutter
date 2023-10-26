import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/screens/category/category_screen.dart';
import 'package:flutter_blog/ui/screens/home/home_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/mykurly_screen.dart';
import 'package:flutter_blog/ui/screens/search/search_screen.dart';
import 'package:flutter_blog/ui/widgets/navigation_items/custom_navigation_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onTabbed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["컬리추천", "신상품", "베스트", "금주혜택"];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo_dark.png",
          width: 100,
          height: 50,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CartScreen()), // CartPage로 이동
                    );
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg", // SVG 이미지 파일 경로
                    width: 30, // 이미지 너비
                    height: 30, // 이미지 높이
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 8,
                  child: Container(
                    width: 14,
                    height: 14,
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 10, color: basicColorB3),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          CategoryScreen(),
          SearchScreen(),
          MyInfoScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          navigationItem.length,
          (index) => _buildBottomNavigationBarItem(
              icon: navigationItem[index].icon,
              label: navigationItem[index].label,
              imgUrl: navigationItem[index].imgUrl),
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: basicColorB3,
        backgroundColor: Colors.white,
        selectedFontSize: 12.0, // 선택된 아이템의 글꼴 크기 설정
        unselectedFontSize: 12.0, // 선택되지 않은 아이템의 글꼴 크기 설정
        onTap: _onTabbed,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String? icon, String? label, String? imgUrl}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: SvgPicture.asset(
            "${icon}",
            width: 24,
            height: 24,
          ),
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: SvgPicture.asset(
            "${imgUrl}", // 아이콘의 이미지를 변경
            width: 24,
            height: 24,
          ),
        ),
      ),
      label: "${label}",
    );
  }
}
