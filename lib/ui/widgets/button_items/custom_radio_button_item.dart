import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_form_view_model.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioButton extends ConsumerWidget {
  const RadioButton({Key? key});

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
        Row(
          children: [
            SizedBox(
              width: 25,
              height: 30,
              child: Transform.scale(
                scale: 1.3,
                child: Radio(
                  value: "MAN",
                  groupValue: model?.userGender ?? "성별없음",
                  onChanged: (value) {
                    ref.read(joinFormProvider.notifier).setUserGender(value!);
                  },
                  activeColor: primaryColor02,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "남자",
              style: basicText(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
              height: 30,
              child: Transform.scale(
                scale: 1.3,
                child: Radio(
                  value: "WOMAN",
                  groupValue: model?.userGender ?? "성별 없음",
                  onChanged: (value) {
                    ref.read(joinFormProvider.notifier).setUserGender(value!);
                  },
                  activeColor: primaryColor02,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "여자",
              style: basicText(),
            ),
          ],
        ),
      ],
    );
  }
}
