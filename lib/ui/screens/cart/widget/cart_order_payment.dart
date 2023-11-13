import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';

class CartOrderPayment extends StatefulWidget {
  const CartOrderPayment({super.key});

  @override
  State<CartOrderPayment> createState() => _CartOrderPaymentState();
}

class _CartOrderPaymentState extends State<CartOrderPayment> {
  Color Color1 = Color(0xffffffff);
  Color pontColor1 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ExpansionTile(
            title: Text(
              "결제수단",
              style: subTitleReqular(),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  'assets/icons/tel.jpg',
                                  width: 40,
                                  height: 20,
                                ),
                                Text("휴대폰")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Image.asset('assets/icons/toss.jpg',
                                    width: 40, height: 30),
                                Text("토스페이")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                ),
                                Image.asset(
                                  'assets/icons/card.jpg',
                                  width: 40,
                                  height: 20,
                                ),
                                Text("카드")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                Color1 = primaryColor02;
                                pontColor1 = Colors.white;
                              });
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1.0),
                                  color: Color1,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset('assets/icons/naverpay.jpg',
                                      width: 40, height: 20),
                                  Text(
                                    "네이버페이",
                                    style: TextStyle(color: pontColor1),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CartCheckBoxItem(
                      text: "선택한 결제수단을 다음에도 사용",
                      textStyle: subTitleReqular(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomLineBold(),
                    SizedBox(
                      height: 20,
                    ),
                    CartCheckBoxItem(
                      text: "결제 진행 필수 동의",
                      textStyle: subTitleReqular(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "개인정보 수집 이용 동의 및 위탁 동의",
                          style: basicText(),
                        ),
                        Text(
                          "(필수)",
                          style: greyToneText(),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "직접 주문취소는 '입금확인' 상태일때만 가능합니다.",
                          style: greyToneText(),
                        ),
                        Text(
                          "미성년자가 결제시 법정대리인이 취소할 수 있습니다.",
                          style: greyToneText(),
                        ),
                        Text(
                          "상품 미배송시, 결제수단으로 환불됩니다.",
                          style: greyToneText(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
