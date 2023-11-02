import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/home/menu/benefit/benefit_screen.dart';
import 'package:flutter_blog/ui/screens/home/menu/best/best_screen.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/kurly_screen.dart';
import 'package:flutter_blog/ui/screens/home/menu/new_product/new_screen.dart';
import 'package:flutter_blog/ui/widgets/custom_main_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required TabController? tabController})
      : _tabController = tabController;
  final TabController? _tabController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  TabController? _tabController;

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1), // 애니메이션 지속 시간을 설정할 수 있습니다.
      curve: Curves.ease, // 애니메이션 커브를 선택할 수 있습니다.
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
      appBar: CustomMainAppbar(
        title: Image.asset(
          "assets/images/logo_dark.png",
          width: 90,
          height: 70,
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Text("컬리추천", style: tabBarTitle()),
              ),
              Tab(
                child: Text("신상품", style: tabBarTitle()),
              ),
              Tab(
                child: Text("베스트", style: tabBarTitle()),
              ),
              Tab(
                child: Text("금주혜택", style: tabBarTitle()),
              ),
            ],
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                KurlyScreen(),
                NewScreen(),
                BestScreen(),
                BenefitScreen(),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _scrollToTop();
      //   },
      //   backgroundColor: basicColorW,
      //   shape: RoundedRectangleBorder(
      //     // 테두리 모양 설정
      //     side: BorderSide(
      //       color: bgAndLineColor, // 원하는 테두리 색상 설정
      //       width: 1.0, // 테두리 두께 설정
      //     ),
      //     borderRadius: BorderRadius.circular(50.0), // 원형 모양
      //   ),
      //   child: Icon(
      //     Icons.arrow_upward,
      //     color: primaryColor,
      //   ),
      // ),
    );
  }
}
