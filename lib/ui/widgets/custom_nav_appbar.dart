import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomNavAppBar extends StatelessWidget {
  final String text;
  final onPressed;
  const CustomNavAppBar({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0.1,
      automaticallyImplyLeading: false,
      backgroundColor: basicColorW,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 22, color: basicColorB5),
        onPressed: () {
          onPressed();
        },
      ),
      titleSpacing: 0,
      centerTitle: true, // 제목을 가운데로 정렬
      title: Text(
        "${text}",
        style: subTitle(),
      ),
    );
  }
}
