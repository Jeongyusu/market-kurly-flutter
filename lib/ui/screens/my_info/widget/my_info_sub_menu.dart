import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoSubMenu extends StatelessWidget {
  String leftText;
  String? left2Text;
  String? rightText;
  MyInfoSubMenu(
      {super.key, required this.leftText, this.left2Text, this.rightText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Consumer(builder: (context, ref, child) {
          ref.read(sessionProvider).logout();
          Navigator.pushNamed(context, Move.loginScreen);
          return SizedBox();
        },);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  leftText,
                  style: subTitleSmall(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    left2Text ?? "",
                    style: greyToneText(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  rightText ?? "",
                  style: subContentsPointSmall(),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
