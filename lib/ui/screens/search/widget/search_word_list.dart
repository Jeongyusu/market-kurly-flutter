import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class SearchWordList extends StatelessWidget {
  const SearchWordList({
    super.key,
    required this.searchResults,
  });

  final List<String> searchResults;

  @override
  Widget build(BuildContext context) {
    List<String> searchResults = [
      "퍼플박스",
      "맥북",
      "애플",
      "아이폰",
      "모바일 앱",
      "아이패드",
      "안드로이드",
      "삼성",
      "플러터",
      "다트",
      "모바일 앱",
      "플러터",
    ];

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            String searchResult = searchResults[index];
            return InkWell(
              onTap: () {
                print("퍼플박스 클릭");
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: bgAndLineColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${index + 1}", style: subContentsPoint()),
                    SizedBox(
                      width: smallGap,
                    ),
                    Text(searchResult, style: basicText()),
                  ],
                ),
              ),
            );
          },
          childCount: searchResults.length,
        ),
      ),
    );
  }
}
