import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/data/repository/product_repository.dart';
import 'package:flutter_blog/ui/screens/search/search_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchTextFormField extends ConsumerWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: primaryColor,
        ),
        fillColor: bgAndLineColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintText: "검색어를 입력해주세요",
        hintStyle: TextStyle(
          color: basicColorB7,
          fontSize: 13,
        ),
        enabledBorder: OutlineInputBorder(
          // 3. 기본 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: bgAndLineColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          // 4. 손가락 터치시 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          // 5. 에러발생시 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // 5. 에러가 발생 후 손가락을 터치했을 때 TextFormField 디자인
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onFieldSubmitted: (value) {
       ref.read(searchProvider.notifier).searchProductList(value);
      },
    );
  }
}
