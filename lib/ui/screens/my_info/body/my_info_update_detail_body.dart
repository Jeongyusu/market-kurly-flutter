import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_form.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_term_agreement.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_update_form.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoUpdateDetailBody extends ConsumerWidget {
  const MyInfoUpdateDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore? sessionStore = ref.read(sessionProvider);
    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "개인정보수정",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    SizedBox(height: smallGap),
                    MyInfoUpdateForm(),
                    SizedBox(height: smallGap),
                    const SizedBox(height: mediumGap),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
