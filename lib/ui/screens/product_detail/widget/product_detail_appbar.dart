import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_cart_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  final onPressed;
  final List<Widget>? actions;
  const ProductDetailAppbar({
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
      backgroundColor: basicColorW,
      leading: IconButton(
        icon: Icon(Icons.close, size: 22, color: basicColorB5),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      titleSpacing: 0,
      centerTitle: true,
      title: Text(
        "${text}",
        style: subTitleSmall(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
