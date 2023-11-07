import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_soft_thin.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';

class CustomerNoticeDetailScreen extends StatelessWidget {
  const CustomerNoticeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "공지사항",
        style: subTitleBold(),
      )),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("[이벤트] 10/31 스켑슐트 라이브 이벤트 당첨자 안내"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "컬리",
                        style: subContents(),
                      ),
                      Text("2023.11.01", style: subContents()),
                    ],
                  ),
                ],
              ),
            ),
            CustomLineSoftThin(),
            Image.asset('assets/images/notice_detail_01.png')
          ],
        ),
      ]),
    );
  }
}
