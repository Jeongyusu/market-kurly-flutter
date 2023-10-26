import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePicker extends ConsumerWidget {
  const DatePicker({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Param? param = ref.watch(paramProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JoinRichTextItem(text: "생년월일"),
        SizedBox(
          height: smallGap,
        ),
        TextButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: basicColorW,
                    height: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime date) {
                        ref.watch(paramProvider.notifier).saveDateTime(date);
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            "${param!.birth!.year}.${param!.birth!.month}.${param!.birth!.day}",
            style: basicText(),
          ),
        ),
      ],
    );
  }
}
