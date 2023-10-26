import 'package:flutter/material.dart';
import 'package:flutter_blog/data/model/category.dart';
import 'package:flutter_blog/ui/screens/category/category_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryProducts extends ConsumerWidget {
  CategoryProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CategoryModel? model = ref.watch(CategoryListProvider);

    List<Category> categorys = [];

    if (model != null) {
      categorys = model.categorys;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: categorys.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      "http://192.168.0.51:8080${categorys[index].categoryPic}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${categorys[index].categoryType}",
                          style: TextStyle(fontWeight: FontWeight.w200),
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
