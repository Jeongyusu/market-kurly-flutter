import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckBoxItem extends ConsumerWidget {
  static const double defaultSize = 24.0;
  String text;
  TextStyle? textStyle;
  double? iconSize;
  CheckBoxItem({
    required this.text,
    this.textStyle,
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Param? param = ref.watch(paramProvider);
    CartListModel? cartListModel = ref.read(cartListProvider);
    return Row(
      children: [
        CheckBoxRounded(
          isChecked: true,
          onTap: (bool? value) {
            print(value);
            ref.read(cartListProvider.notifier).AllChecked(value!);
            // for (int i = 0;
            //     i < cartListModel!.cartDTO.cartProducts.length;
            //     i++) {
            //   ref.read(paramProvider.notifier).removeListAdd(i);
            // }
          },
          checkedColor: primaryColor02,
          size: iconSize ?? defaultSize,
          uncheckedWidget: Icon(
            Icons.check,
            size: 20 ?? defaultSize,
            color: basicColorB9,
          ),
        ),
        SizedBox(
          width: smallGap,
        ),
        Text(
          "$text",
          style: textStyle,
        ),
      ],
    );
  }
}
