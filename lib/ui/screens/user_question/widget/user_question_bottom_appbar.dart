import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class UserQuestionBottomAppbar extends StatelessWidget {
  final String text;
  final Function? funPageRoute;
  UserQuestionBottomAppbar({
    Key? key,
    required this.text,
    this.funPageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
          onPressed: funPageRoute as void Function()?,
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(50),
            backgroundColor: primaryColor,
          ),
          child: Text("$text"),
        ),
      ),
    );
  }
}
