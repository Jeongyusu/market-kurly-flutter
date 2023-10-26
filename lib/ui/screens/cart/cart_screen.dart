import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class CartScreen extends ConsumerWidget {
  CartScreen();

  // 초기 수량
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Param? param = ref.watch(paramProvider);
    CartListModel? cartDTOListModel = ref.watch(cartDTOListProvider);
    if (cartDTOListModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                "장바구니",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CheckBoxItem(
                          text: "전체삭제",
                        ),
                        SizedBox(width: 160),
                        Text(
                          "선택삭제",
                          style: basicText(),
                        ),
                      ],
                    ),
                    SizedBox(height: mlargeGap),
                    ListView.builder(
                        shrinkWrap: true, // 이 줄을 추가
                        primary: false,
                        itemCount: 3,
                        // itemCount: cartDTOListModel?.cartDTO.cartProducts.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  CheckBoxRounded(
                                    isChecked: param!.isChecked,
                                    onTap: (bool? value) {},
                                    checkedColor: Colors.purple,
                                    size: 18,
                                    uncheckedWidget: Icon(
                                        Icons.check_circle_outline_outlined),
                                  ),
                                  Text(
                                    cartDTOListModel
                                            ?.cartDTO
                                            .cartProducts[index]
                                            .productSeller ??
                                        "",
                                    style: basicText(),
                                  ),
                                  SizedBox(width: mediumGap),
                                  Text(
                                    cartDTOListModel?.cartDTO
                                            .cartProducts[index].productTitle ??
                                        "",
                                    style: basicText(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets${cartDTOListModel?.cartDTO.cartProducts[index].image}',
                                    width: 60,
                                    height: 90,
                                  ),
                                  //할인된가격,할인전가격, 수량 컬럼
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${cartDTOListModel?.cartDTO.cartProducts[index].discountedPrice}원" ??
                                                "에러",
                                          ),
                                          Text(
                                              "${cartDTOListModel?.cartDTO.cartProducts[index].beforeDiscount}원" ??
                                                  "에러",
                                              style: disabledText()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 15,
                                            height: 15,
                                            child: GestureDetector(
                                              onTap: () {
                                                ref
                                                    .watch(cartDTOListProvider
                                                        .notifier)
                                                    .plusQuantity(index);
                                                ref
                                                    .read(cartDTOListProvider
                                                        .notifier)
                                                    .calSumOriginPrice();
                                                ref
                                                    .read(cartDTOListProvider
                                                        .notifier)
                                                    .calSumDiscountPrice();
                                              },
                                              child: SvgPicture.asset(
                                                "assets/icons/minus.svg",
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "${cartDTOListModel?.cartDTO.cartProducts[index].quentity}" ??
                                                  "에러"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            child: GestureDetector(
                                              onTap: () {
                                                ref
                                                    .watch(cartDTOListProvider
                                                        .notifier)
                                                    .minusQuantity(index);
                                                ref
                                                    .read(cartDTOListProvider
                                                        .notifier)
                                                    .calSumOriginPrice();
                                                ref
                                                    .read(cartDTOListProvider
                                                        .notifier)
                                                    .calSumDiscountPrice();
                                              },
                                              child: SvgPicture.asset(
                                                "assets/icons/plus.svg",
                                                width: 30,
                                                height: 30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("상품금액"),
                            Text(
                                "${cartDTOListModel!.cartDTO.totalBeforePrice}원"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("상품할인금액"),
                            Text(
                                "${cartDTOListModel!.cartDTO.totalDiscountPrice}원"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("배송비"),
                            Text("0원"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("결제예정금액"),
                            Text(
                                "${cartDTOListModel!.cartDTO.totalBeforePrice - cartDTOListModel.cartDTO.totalDiscountPrice}원"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    print("주문하기 클릭됨");
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(0, 50), backgroundColor: primaryColor),
                  child: Text("주문하기")),
            ),
          )
        ],
      );
    }
  }
}
