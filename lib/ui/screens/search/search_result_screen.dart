import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/search/search_body/search_result_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchResultBody(),
    );
  }
}
