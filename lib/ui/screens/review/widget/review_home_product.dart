import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_item.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_option_title.dart';
import 'package:flutter_blog/ui/screens/cart/widget/cart_order_cancel_option_item.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_elavated_button.dart';
import 'package:flutter_blog/ui/screens/review/widget/review_home_option_item.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_bottom_icon_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewHomeProduct extends ConsumerWidget {
  String bottomRightText;
  TextStyle bottomRightTextStyle;
  ReviewHomeProduct(
      {super.key,
      required this.bottomRightText,
      required this.bottomRightTextStyle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartListModel? cartListModel = ref.watch(cartListProvider);
    Param? param = ref.watch(paramProvider);

    return ListView.builder(
      shrinkWrap: true, // 이 줄을 추가
      primary: false,
      itemCount: cartListModel?.cartDTO.cartProducts.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: smallGap,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReviewHomeOptionItem(
                            index: index,
                            bottomRightText: bottomRightText,
                            bottomRightTextStyle: bottomRightTextStyle,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              color: primaryColor02,
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  " 후기 쓰기",
                                  style: reviewWrite(),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
