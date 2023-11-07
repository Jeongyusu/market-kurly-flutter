import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/category/category_body/category_body.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_main_appbar.dart';

import 'widget/category_product.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppbar(
        title: Text(
          "카테고리",
          style: appBarTitle(),
        ),
      ),
      body: CategoryBody(),
    );
  }
}
