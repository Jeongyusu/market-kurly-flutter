import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/screens/category/category_screen.dart';
import 'package:flutter_blog/ui/screens/home/home_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_screen.dart';
import 'package:flutter_blog/ui/screens/search/search_screen.dart';
import 'package:flutter_blog/ui/widgets/navigation_items/custom_navigation_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _onTabbed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["컬리추천", "신상품", "베스트", "금주혜택"];
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(tabController: _tabController),
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
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
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
            "${imgUrl}",
            width: 24,
            height: 24,
          ),
        ),
      ),
      label: "${label}",
    );
  }
}
