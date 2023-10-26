import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/widget/pw_search_form.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';

class PwSearchBody extends StatelessWidget {
  const PwSearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "비밀번호 찾기",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: smallGap),
                  PwSearchForm(),
                  SizedBox(height: smallGap),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
