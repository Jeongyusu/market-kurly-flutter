import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class HomeKurlyMenuTitle extends StatelessWidget {
  final String title;
  const HomeKurlyMenuTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${title}",
                  style: subTitleBold(),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                // 아이콘이 클릭되었을 때의 동작을 정의합니다.
              },
              child: Container(
                padding: EdgeInsets.all(4.0), // 아이콘과 텍스트 사이의 간격을 조절합니다.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "전체보기",
                      style: subContentsPointSmall(),
                    ),
                    SizedBox(width: 2.0), // 아이콘과 텍스트 사이의 간격을 조절합니다.

                    Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                      size: 11,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
