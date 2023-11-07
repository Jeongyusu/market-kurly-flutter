import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';

class ProductDescriptionBody extends StatelessWidget {
  const ProductDescriptionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/images/1.jpg",
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
                              text: "[ 판매자 ]",
                              style: strongTextSmall(),
                            ),
                            TextSpan(
                              text: " 고당도 제주 유라 감귤 800g",
                              style: strongTextSmall(),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        "가득 머금은 상큼달콤한 과즙",
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
                                    text: "20%",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.redAccent),
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(width: smallGap),
                                  ),
                                  TextSpan(
                                    text: "10,600",
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
                              "13,900원",
                              style: disabledTextBig(),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "원산지 : 국산 (제주도산)",
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
                        child: Image.asset(
                          "assets/images/product/product_detail_01.png",
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
