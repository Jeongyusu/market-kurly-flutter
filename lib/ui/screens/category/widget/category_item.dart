import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CategoryItem extends StatelessWidget {
  final int imagePathIndex; // Receive the index for the image
  final String category;

  CategoryItem({
    Key? key,
    required this.imagePathIndex,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _categoryItemImg(),
          _categoryItemText(),
        ],
      ),
    );
  }

//  카테고리 이미지
  Widget _categoryItemImg() {
    return Expanded(
      child: Image.asset(
        "assets/images/$imagePathIndex.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

//  카테고리 텍스트
  Widget _categoryItemText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            category,
            style: basicTextSmall(),
          ),
        ),
      ),
    );
  }
}
