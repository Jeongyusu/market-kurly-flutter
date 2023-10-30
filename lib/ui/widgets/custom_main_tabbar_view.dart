// import 'package:flutter/material.dart';
// import 'package:flutter_blog/ui/screens/home/menu/benefit/benefit_screen.dart';
// import 'package:flutter_blog/ui/screens/home/menu/best/best_screen.dart';
// import 'package:flutter_blog/ui/screens/home/menu/kurly/kurly_screen.dart';
// import 'package:flutter_blog/ui/screens/home/menu/new_product/new_product_screen.dart';
//
// class CustomMainTabbarView extends StatefulWidget {
//   const CustomMainTabbarView({
//     super.key,
//     required TabController? tabController,
//   }) : _tabController = tabController;
//
//   final TabController? _tabController;
//
//   @override
//   State<CustomMainTabbarView> createState() => _CustomMainTabbarViewState();
// }
//
// class _CustomMainTabbarViewState extends State<CustomMainTabbarView> {
//   final ScrollController _scrollController = ScrollController();
//
//   void _scrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: Duration(seconds: 1), // 애니메이션 지속 시간을 설정할 수 있습니다.
//       curve: Curves.ease, // 애니메이션 커브를 선택할 수 있습니다.
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: TabBarView(
//         controller: widget._tabController,
//         children: [
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: <Widget>[
//               KurlyScreen(),
//               NewProductScreen(),
//               BestScreen(),
//               BenefitScreen(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
