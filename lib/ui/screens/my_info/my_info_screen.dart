import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_screen.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                          "이은지 님",
                          style: strongTextmMedium(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "보유 쿠폰 2장",
                        style: basicText(),
                      )),
                  Container(
                      padding: EdgeInsets.only(bottom: 25),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "2만원 이상 무료배송",
                        style: basicText(),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "배송지",
                        style: subTitleReqular(),
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
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "쿠폰",
                            style: subTitleReqular(),
                          ),
                          Row(
                            children: [
                              Text(
                                "2장",
                                style: subContentsPointSmall(),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(),
                  Row(),
                  Row(),
                  Row(),
                  Row(),
                  Row(),
                  Row(),
                  Row(),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
