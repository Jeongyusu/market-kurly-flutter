import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/user_search/id_search_complete_screen/id_search_complete_body.dart';
import 'package:flutter_blog/ui/widgets/custom_svg_image.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdSearchCompleteScreen extends StatelessWidget {
  const IdSearchCompleteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _userSearchAppbar(
        context,
        "아이디 찾기",
        () {
          Navigator.pop(context);
        },
      ),
      body: IdSearchCompleteBody(),
    );
  }

  PreferredSizeWidget _userSearchAppbar(
      BuildContext context, String text, void Function() onPressed) {
    return AppBar(
      backgroundColor: basicColorW,
      title: Text(
        text,
        style: subTitle(),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 22, color: basicColorB5),
        onPressed: onPressed,
      ),
    );
  }
}
