import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_sub_menu.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_sub_menu_logout.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';

class MyInfoArrowBoard extends StatelessWidget {
  const MyInfoArrowBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyInfoSubMenu(leftText: "쿠폰"),
        CustomLineThin(),
        MyInfoSubMenu(leftText: "주문내역"),
        CustomLineThin(),
        MyInfoSubMenu(leftText: "상품 후기"),
        CustomLineThin(),
        MyInfoSubMenu(leftText: "개인 정보 수정"),
        CustomLineThin(),
        MyInfoSubMenu(leftText: "앱 푸시 알림 설정"),
        CustomLineThin(),
        MyInfoSubMenu(leftText: "고객센터"),
        CustomLineThin(),
        MyInfoSubMenu(
          leftText: "앱 버전",
          left2Text: "3.19.0",
          rightText: "최신 버전",
        ),
        CustomLineThin(),
        MyInfoSubMenuLogout(leftText: "로그아웃"),
        CustomLineThin(),
      ],
    );
  }
}
