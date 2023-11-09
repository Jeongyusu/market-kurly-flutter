import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_description/product_description_view_model.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDescriptionBody extends ConsumerWidget {
  final int productId;
  const ProductDescriptionBody({
    required this.productId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductDescriptionModel? model =
        ref.watch(productDescriptionProvider(productId));
    String imgUrl = dio.options.baseUrl;
    if (model == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      ProductDescriptionDTO? productDetail = model.productDescriptionDTO;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 480,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.network(
                  "${imgUrl}${productDetail!.productThumbnail}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "[ ${productDetail.seller} ]",
                                style: strongTextSmall(),
                              ),
                              WidgetSpan(
                                child: SizedBox(width: xsmallGap),
                              ),
                              TextSpan(
                                text: productDetail.productName,
                                style: strongTextSmall(),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          productDetail.productContent,
                          style: subContents(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${productDetail.discountRate}%",
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.redAccent),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(width: smallGap),
                                    ),
                                    TextSpan(
                                      text: "${productDetail.discountedPrice}",
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black87),
                                    ),
                                    TextSpan(
                                      text: " 원", // "원"을 따로 추가
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "${productDetail.originPrice}%",
                                style: disabledTextBig(),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          productDetail.productOrigin,
                          style: subTitleSmall(),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomLineThin(),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("판매자", style: subContentsBold()),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("컬리", style: subTitleSmall()),
                            ],
                          ),
                        ],
                      )),
                ),
                CustomLineBold(),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("상품정보", style: subTitleReqular()),
                        SizedBox(
                          height: smallGap,
                        ),
                        Container(
                          child: Image.network(
                            "${imgUrl}${productDetail!.productDetailImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
