import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_cart_bottom_bar.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_appbar.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_option_count.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductBottomSheetItem extends ConsumerWidget {
  final productId;
  const ProductBottomSheetItem({
    super.key, this.productId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductDescriptionModel? model = ref.watch(productDescriptionProvider(productId));
    return Builder(
      builder: (BuildContext innerContext) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  ProductDetailAppbar(
                    text: "상품선택",
                    onPressed: () {
                      Navigator.pop(innerContext);
                    },
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomLineThin(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    "assets/images/product01.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: smallGap,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "[ ${model!.productDescriptionDTO!.seller} ]",
                                      style: subContents(),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(width: xsmallGap),
                                    ),
                                    TextSpan(
                                      text: model!.productDescriptionDTO!.productName,
                                      style: subContents(),
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                        CustomLineBold(),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0, bottom: 66.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: bgAndLineColor,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(model!.productDescriptionDTO!.options[index].optionName),
                                      SizedBox(
                                        height: xsmallGap,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${model!.productDescriptionDTO!.options[index].optionPrice}"),
                                          ProductOptionCount(index: index, productId: productId,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        childCount: model!.productDescriptionDTO!.options.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ProductCartBottomBar(),
            ),
          ],
        );
      },
    );
  }
}
