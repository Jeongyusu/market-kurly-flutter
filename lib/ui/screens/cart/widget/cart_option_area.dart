import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class CartOptionArea extends ConsumerWidget {
  const CartOptionArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true, // 이 줄을 추가
        primary: false,
        itemCount: cartListModel!.cartDTO.cartProducts.length,
        // itemCount: cartDTOListModel?.cartDTO.cartProducts.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckBoxRounded(
                    isChecked:
                        cartListModel!.cartDTO.cartProducts[index].isChecked,
                    onTap: (bool? value) {
                      ref
                          .read(cartListProvider.notifier)
                          .isCheckedChanged(index);
                      ref.read(cartListProvider.notifier).calSumOriginPrice();
                      ref.read(cartListProvider.notifier).calSumDiscountPrice();
                    },
                    checkedColor: primaryColor,
                    size: 22,
                    uncheckedWidget: Icon(
                      Icons.check,
                      size: 18,
                      color: basicColorB9,
                    ),
                  ),
                  SizedBox(
                    width: smallGap,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartOptionTitle(index: index),
                      CartOptionItem(index: index),
                      SizedBox(height: mediumGap),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
