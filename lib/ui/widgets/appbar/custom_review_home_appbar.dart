import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomReviewHomeAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  const CustomReviewHomeAppbar({
    super.key,
    required this.title,
  });

  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: title,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 22, color: basicColorB7),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CartScreen()), // CartPage로 이동
                  );
                },
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg", // SVG 이미지 파일 경로
                  width: 30, // 이미지 너비
                  height: 30,
                  color: Colors.black, // 이미지 높이
                ),
              ),
              Positioned(
                top: 5,
                right: 8,
                child: Container(
                  width: 14,
                  height: 14,
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 10, color: basicColorW),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
