import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_form.dart';
import 'package:flutter_blog/ui/widgets/custom_logo.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0.1,
          automaticallyImplyLeading: false,
          backgroundColor: basicColorW,
          leading: IconButton(
            icon: Icon(Icons.close, size: 26, color: basicColorB5),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleSpacing: 0,
          centerTitle: true, // 제목을 가운데로 정렬
          title: Text(
            "로그인",
            style: subTitle(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomLogo(),
                  SizedBox(height: smallGap),
                  LoginForm(),
                  SizedBox(height: smallGap),
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
