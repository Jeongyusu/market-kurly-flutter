import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/cart_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCartAndQuantity extends ConsumerWidget {
  const CustomCartAndQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Padding(
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
                  "${cartListModel?.cartDTO.cartProducts.length ?? 0}",
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
    );
  }
}
