import 'package:flutter/material.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_screen.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                "회원 가입하고\n다양한 혜택을 받아보세요!",
                textAlign: TextAlign.center, // 텍스트를 가운데 정렬하려면 사용합니다.
              ),
            ),
            CustomElevatedButton(
              text: "로그인 / 회원가입",
              funPageRoute: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
