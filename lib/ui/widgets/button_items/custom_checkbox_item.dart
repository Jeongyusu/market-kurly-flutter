import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckBoxItem extends ConsumerWidget {
  static const double defaultSize = 24.0;
  String text;
  double? iconSize;
  CheckBoxItem({
    required this.text,
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        CheckBoxRounded(
          onTap: (bool? value) {
            ref.read(paramProvider.notifier).AllChecked();
          },
          checkedColor: primaryColor02,
          size: iconSize ?? defaultSize,
          uncheckedWidget: Icon(
            Icons.check,
            size: iconSize ?? defaultSize,
            color: basicColorB9,
          ),
        ),
        SizedBox(
          width: smallGap,
        ),
        Text(
          "$text",
          style: basicText02(),
        ),
      ],
    );
  }
}
