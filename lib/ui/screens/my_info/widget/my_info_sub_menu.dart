import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';

class MyInfoSubMenu extends StatelessWidget {
  String leftText;
  String? left2Text;
  String? rightText;
  String route;
  MyInfoSubMenu({
    super.key,
    required this.leftText,
    this.left2Text,
    this.rightText,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
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
