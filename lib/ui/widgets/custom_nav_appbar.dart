import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_cart_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final onPressed;
  final List<Widget>? actions;
  const CustomNavAppBar({
    super.key,
    required this.text,
    this.onPressed,
    this.actions,
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
      centerTitle: true,
      title: Container(
        width: 250,
        child: Text(
          "${text}",
          style: subTitleSmall(),
        ),
      ),
      actions: [
        CustomCartIcon(
          cartIconSvg: "assets/icons/cart_dark.svg",
          countBgColor: primaryColor,
          countTextColor: basicColorW,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
