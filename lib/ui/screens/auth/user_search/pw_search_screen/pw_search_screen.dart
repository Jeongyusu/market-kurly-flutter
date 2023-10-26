import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/login_body/login_body.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/pw_search_screen/pw_search_body.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/widget/pw_search_form.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';

class PwSearchScreen extends StatelessWidget {
  const PwSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PwSearchBody(),
    );
  }
}
