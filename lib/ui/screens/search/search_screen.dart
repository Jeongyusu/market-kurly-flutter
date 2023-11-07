import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/search/search_body/search_body.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_text_form.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_text_form_field.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_text_title.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_word_list.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_main_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
    return Scaffold(
      appBar: CustomMainAppbar(
        title: Text(
          "검색",
          style: appBarTitle(),
        ),
      ),
      body: SearchBody(searchResults: searchResults),
    );
  }
}
