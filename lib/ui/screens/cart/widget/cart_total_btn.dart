import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../cart_list_view_model.dart';

class CartTotalBtn extends ConsumerWidget {
  const CartTotalBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.read(cartListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: CartCheckBoxItem(
              text: "전체선택",
              textStyle: basicTextBig(),
            ),
          ),
          InkWell(
            onTap: () {
              ref.read(cartListProvider.notifier).checkedRemove();
              ref.read(cartListProvider.notifier).calSumOriginPrice();
              ref.read(cartListProvider.notifier).calSumDiscountPrice();
              // Logger().d(
              //     "나 여기용 ${cartListModel!.checkedCartDTO?[0].optionQuantity ?? null}");
              // Logger()
              //     .d("남은 리스트갯수 ${cartListModel!.cartDTO!.cartProducts.length}");
            },
            child: Text(
              "선택삭제",
              style: basicText(),
            ),
          ),
        ],
      ),
    );
  }
}
