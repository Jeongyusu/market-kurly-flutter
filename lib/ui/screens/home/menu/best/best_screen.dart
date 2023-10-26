import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BestPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productListProvider);

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: basicColorW,
            titleSpacing: 0,
            actions: [
              Container(
                child: Text(
                  "신상품순",
                  style: TextStyle(color: basicColorB3),
                ),
              )
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets${model.products[index].thumbnail}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${model.products[index].seller}",
                              style: basicText(),
                            ),
                            WidgetSpan(
                              child: SizedBox(width: smallGap),
                            ),
                            TextSpan(
                              text: "${model.products[index].productTitle}",
                              style: basicText(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "${model.products[index].price} 원",
                      style: disabledText(),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${model.products[index].discountRate}%",
                            style: discountText(),
                          ),
                          WidgetSpan(
                            child: SizedBox(width: smallGap),
                          ),
                          TextSpan(
                            text: "${model.products[index].totalPrice}원",
                            style: subTitle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: model.products.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
          ),
        ],
      );
    }
  }
}
