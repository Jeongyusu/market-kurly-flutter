import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_form_view_model.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePicker extends ConsumerWidget {
  const DatePicker({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinFormModel? model = ref.watch(joinFormProvider);
    SessionStore sessionStore = ref.read(sessionProvider);

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
                        ref.read(joinFormProvider.notifier).setUserBirth(date);
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            "${model?.userBirth?.year ?? 0000}.${model?.userBirth?.month ?? 00}.${model?.userBirth?.day ?? 00}",
            style: basicText(),
          ),
        ),
      ],
    );
  }
}
