import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

import 'search_text_form_field.dart';

class SearchTextForm extends StatelessWidget {
  const SearchTextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      sliver: SliverAppBar(
        pinned: true,
        elevation: 0,
        expandedHeight: 40,
        backgroundColor: basicColorW,
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          title: SearchTextFormField(),
          titlePadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
