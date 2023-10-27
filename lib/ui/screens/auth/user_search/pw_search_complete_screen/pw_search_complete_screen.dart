import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/custom_svg_image.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pw_search_complete_body.dart';

class PwSearchCompleteScreen extends StatelessWidget {
  const PwSearchCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: basicColorW,
        title: Text(
          "비밀번호 찾기",
          style: subTitleReqular(),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, size: 26, color: basicColorB5),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PwSearchCompleteBody(),
    );
  }
}
