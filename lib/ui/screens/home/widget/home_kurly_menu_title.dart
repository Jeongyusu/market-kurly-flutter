import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_screen.dart';

class HomeKurlyMenuTitle extends StatelessWidget {
  final String title;
  const HomeKurlyMenuTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 12, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${title}",
                  style: subTitleReqular(),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductCategoryScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "전체보기",
                      style: subContentsPointSmall(),
                    ),
                    SizedBox(width: 2.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                      size: 11,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
