import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/model/category.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_category/product_category_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryBody extends ConsumerWidget {
  final int? categoryId;
  CategoryBody({Key? key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryModel? model = ref.watch(categoryListProvider);
    String imgUrl = dio.options.baseUrl;

    List<Category> categoryModel = model!.categorys;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: categoryModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ref
                  .read(categoryListProvider.notifier)
                  .selectCategoryIdAndCategoryName(categoryModel[index].id!,
                      categoryModel[index].categoryType!);
              Navigator.pushNamed(context, Move.productCategoryScreen);
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      "${imgUrl}${categoryModel[index].categoryPic}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${categoryModel[index].categoryType}",
                          style: basicText(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
