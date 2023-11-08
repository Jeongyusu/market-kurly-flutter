import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSimpleAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  const CustomSimpleAppbar({
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
    );
  }
}
