import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class ProductItemCount extends StatelessWidget {
  final int count;
  const ProductItemCount({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '총 ${count} 개',
              style: strongTextSmall(),
            ),
          ],
        ),
      ),
    );
  }
}
