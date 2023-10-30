import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "급상승검색어",
                  style: strongTextmMedium(),
                ),
                Icon(
                  Icons.question_mark,
                  size: 18,
                  color: primaryColor,
                )
              ],
            ),
            Text(
              "최근 1시간동안 검색 횟수가 급상승했어요",
              style: subContents(),
            )
          ],
        ),
      ),
    );
  }
}
