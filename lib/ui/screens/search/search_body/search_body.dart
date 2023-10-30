import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_text_form.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_text_title.dart';
import 'package:flutter_blog/ui/screens/search/widget/search_word_list.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required this.searchResults,
  });

  final List<String> searchResults;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SearchTextForm(),
      SearchTextTitle(),
      SearchWordList(searchResults: searchResults)
    ]);
  }
}
