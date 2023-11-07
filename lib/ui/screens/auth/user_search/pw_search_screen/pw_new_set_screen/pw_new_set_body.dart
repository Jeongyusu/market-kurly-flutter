import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_form.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_term_agreement.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/widget/pw_new_form.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:flutter_blog/ui/widgets/custom_date_picker.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_logo.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';

class PwNewSetBody extends StatelessWidget {
  const PwNewSetBody({Key? key}) : super(key: key);

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
              child: Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    SizedBox(height: smallGap),
                    PwNewForm(),
                    CustomElevatedButton(
                      text: "확인",
                      funPageRoute: () {
                        // if (_formKey.currentState!.validate()) {
                        //   LoginReqDTO loginReqDTO = LoginReqDTO(
                        //       username: _username.text, password: _password.text);
                        //   ref.read(sessionProvider).login(loginReqDTO);
                        // }
                        Navigator.pushNamed(context, Move.loginScreen);
                      },
                    ),
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
