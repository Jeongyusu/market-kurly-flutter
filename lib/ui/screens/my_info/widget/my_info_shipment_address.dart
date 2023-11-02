import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class MyInfoShipmentAddress extends StatelessWidget {
  const MyInfoShipmentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 50,
      color: pointColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "배송지",
                style: basicTextBig(),
              ),
            ),
          ),
          Container(
              constraints: BoxConstraints(maxWidth: 250),
              child: Row(
                children: [
                  Flexible(
                      child: Text(
                    "부산광역시 연제구 거제2동 그린컴퓨터 아카데미입니다",
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
    );
  }
}
