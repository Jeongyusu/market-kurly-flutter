import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/search/search_body/search_result_body.dart';
import 'package:flutter_blog/ui/screens/search/search_view_model.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultScreen extends ConsumerWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchModel? searchModel = ref.read(searchProvider);
    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "\"${searchModel!.inputValue}\" 검색 결과",
        style: subTitleBold(),
      )),
      body: SearchResultBody(),
    );
  }
}
