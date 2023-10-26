import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_form.dart';
import 'package:flutter_blog/ui/widgets/custom_logo.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "로그인",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomLogo(),
                  LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Move.idSearchScreen);
                        },
                        child: Text(
                          "아이디찾기",
                          style: TextStyle(color: basicColorB7),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 1, // 선의 너비
                          height: 15, // 선의 높이
                          color: basicColorB9, // 선의 색상
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Move.pwSearchScreen);
                        },
                        child: Text(
                          "비밀번호 찾기",
                          style: TextStyle(color: basicColorB7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediumGap),
                  CustomTextButton(
                    "회원가입",
                    () {
                      Navigator.pushNamed(context, Move.joinScreen);
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
