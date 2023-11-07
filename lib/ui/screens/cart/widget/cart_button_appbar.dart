import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_total_btn.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartButtonAppbar extends StatelessWidget {
  const CartButtonAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 0.1,
      backgroundColor: basicColorW,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(vertical: 5.0),
        background: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 10,
                color: bgAndLineColor,
              ),
            ),
          ),
          child: CartTotalBtn(),
        ),
      ),
    );
  }
}
