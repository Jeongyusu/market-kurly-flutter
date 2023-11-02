import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class MyInfoProfile extends StatelessWidget {
  const MyInfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
