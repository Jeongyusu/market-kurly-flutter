import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  const CustomMainAppbar({
    super.key,
    required this.title,
  });

  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CartScreen()),
                  );
                },
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  width: 30,
                  height: 30,
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
                      style: TextStyle(fontSize: 10, color: basicColorB3),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
