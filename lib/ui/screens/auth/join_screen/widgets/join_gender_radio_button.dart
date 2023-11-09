import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_form_view_model.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinGenderRadioButton extends ConsumerWidget {
  const JoinGenderRadioButton({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinFormModel? model = ref.watch(joinFormProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        JoinRichTextItem(
          text: "성별",
          strong: " *",
        ),
        SizedBox(
          height: xsmallGap,
        ),
        CustomRadioButton(
          label: "남자",
          value: "MAN",
          groupValue: model?.userGender ?? "성별없음",
          onChanged: (value) {
            print(value);
            ref.read(joinFormProvider.notifier).setUserGender(value!);
          },
        ),
        CustomRadioButton(
          label: "여자",
          value: "WOMAN",
          groupValue: model?.userGender ?? "성별없음",
          onChanged: (value) {
            print(value);
            ref.read(joinFormProvider.notifier).setUserGender(value!);
          },
        ),
      ],
    );
  }
}
