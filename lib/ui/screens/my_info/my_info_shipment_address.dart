import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';

class MyInfoShipmentAddress extends StatelessWidget {
  const MyInfoShipmentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 50,
      color: pointColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Move.myInfoAddressScreen);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "배송지 관리",
                style: basicTextBig(),
              ),
            ),
            Container(
                constraints: BoxConstraints(maxWidth: 250),
                child: Row(
                  children: [
                    Flexible(
                        child: Text(
                      "                                                                    ",
                      overflow: TextOverflow.ellipsis,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
