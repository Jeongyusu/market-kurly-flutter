import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/my_info/my_info_update_form.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
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
