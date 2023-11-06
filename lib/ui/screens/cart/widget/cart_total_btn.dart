import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../cart_list_view_model.dart';

class CartTotalBtn extends ConsumerWidget {
  const CartTotalBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Param? param = ref.read(paramProvider);
    CartListModel? cartListModel = ref.read(cartListProvider);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CheckBoxItem(
              text: "전체선택",
              textStyle: basicTextBig(),
            ),
            InkWell(
              onTap: () {
                ref.read(cartListProvider.notifier).selectedCartItemRemove();
                Logger().d("남은 리스트갯수 ${cartListModel!.cartDTO!.cartProducts.length}");
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

