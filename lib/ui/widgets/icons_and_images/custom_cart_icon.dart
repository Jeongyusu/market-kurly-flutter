import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCartIcon extends StatelessWidget {
  final String? cartIconSvg;
  final Color? countBgColor;
  final Color? countTextColor;
  const CustomCartIcon({
    super.key,
    this.cartIconSvg,
    this.countBgColor,
    this.countTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: SvgPicture.asset(
              "${cartIconSvg}",
              width: 30,
              height: 30,
              fit: BoxFit.cover,
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
                  style: TextStyle(
                      fontSize: 9,
                      color: countTextColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(
                color: countBgColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
