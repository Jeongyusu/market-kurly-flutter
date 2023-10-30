import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/category/widget/category_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryBody extends ConsumerWidget {
  final List<String> categorys = [
    "국·반찬·메인요리",
    "샐러드·간편식",
    "면·양념·오일",
    "의약품",
    "수산·해산·건어물",
    "생수·음료·우유",
    "건강식품",
    "주류·와인",
  ];

  CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: categorys.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: CategoryItem(
              imagePathIndex: index + 1,
              category: categorys[index],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
