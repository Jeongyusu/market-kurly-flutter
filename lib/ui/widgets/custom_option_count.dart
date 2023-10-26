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
    CartListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: bgAndLineColor),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0), // 선택적으로 모서리를 라운드 처리할 수 있음
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
                  ref.watch(cartDTOListProvider.notifier).minusQuantity(index);
                  ref.read(cartDTOListProvider.notifier).calSumOriginPrice();
                  ref.read(cartDTOListProvider.notifier).calSumDiscountPrice();
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
            Text("${cartDTOListModel?.cartDTO.cartProducts[index].quentity}" ??
                "에러"),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  ref.watch(cartDTOListProvider.notifier).calSumDiscountPrice();
                  ref.read(cartDTOListProvider.notifier).calSumOriginPrice();
                  ref.read(cartDTOListProvider.notifier).plusQuantity(index);
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
