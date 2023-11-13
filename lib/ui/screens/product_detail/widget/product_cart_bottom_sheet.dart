import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCartBottomSheet extends ConsumerWidget {
  const ProductCartBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 250,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(child: Container()),
              IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: basicColorB5,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    "assets/images/product01.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: smallGap,
                ),
                Text(
                  "장바구니에 상품을 담았습니다.",
                  style: subTitleSmall(),
                ),
                SizedBox(
                  height: smallGap,
                ),
                InkWell(
                  onTap: () {
                    ref.read(cartListProvider.notifier).notifyInit();
                    Navigator.pushNamed(context, Move.cartScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/cart_dark.svg",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: xsmallGap,
                      ),
                      Text(
                        "장바구니로 이동하기",
                        style: subContentsPointSmall(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
