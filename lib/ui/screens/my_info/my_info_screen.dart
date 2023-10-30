import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_screen.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_sub_menu.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/custom_main_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_regular.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppbar(
        title: Text(
          "마이컬리",
          style: appBarTitle(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo_dark.png',
                        width: 50,
                        height: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "마켓컬리 님",
                        style: strongTextmMedium(),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "보유 쿠폰 2장",
                      style: basicText(),
                    )),
                Container(
                    padding: EdgeInsets.only(left: 20, bottom: 25),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "2만원 이상 무료배송",
                      style: basicText(),
                    )),
                Container(
                  width: 450,
                  height: 50,
                  color: pointColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "배송지",
                            style: basicTextBig(),
                          ),
                        ),
                      ),
                      Container(
                          constraints: BoxConstraints(maxWidth: 250),
                          child: Row(
                            children: [
                              Flexible(
                                  child: Text(
                                "부산광역시 연제구 거제2동 그린컴퓨터 아카데미입니다",
                                overflow: TextOverflow.ellipsis,
                              )),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
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
                      MyInfoSubMenu(leftText: "로그아웃"),
                      CustomLineThin(),
                    ],
                  ),
                ),
                Row(),
                Row(),
                Row(),
                Row(),
                Row(),
                Row(),
                Row(),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
