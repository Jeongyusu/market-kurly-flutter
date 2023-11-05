import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOptionCount extends ConsumerWidget {
  final int index;
  const CustomOptionCount({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: bgAndLineColor),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  ref.watch(cartListProvider.notifier).minusQuantity(index);
                  ref.read(cartListProvider.notifier).calSumOriginPrice();
                  ref.read(cartListProvider.notifier).calSumDiscountPrice();
                },
                child: SvgPicture.asset(
                  "assets/icons/minus.svg",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text("${cartListModel?.cartDTO.cartProducts[index].optionQuantity}" ??
                "에러"),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  ref.watch(cartListProvider.notifier).calSumDiscountPrice();
                  ref.read(cartListProvider.notifier).calSumOriginPrice();
                  ref.read(cartListProvider.notifier).plusQuantity(index);
                },
                child: SvgPicture.asset(
                  "assets/icons/plus.svg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
