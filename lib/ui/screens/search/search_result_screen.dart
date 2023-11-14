import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/search/search_body/search_result_body.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "검색 결과",
        style: subTitleBold(),
      )),
      body: SearchResultBody(),
    );
  }
}
