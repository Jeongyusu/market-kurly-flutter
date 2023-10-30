import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CartOrderCancelQuestion extends StatelessWidget {
  const CartOrderCancelQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15),
      child: Row(
        children: [
          Container(width: 250,child: Text("직접 주문 취소는 입금확인 상태일 경우에만 가능합니다.", style: subContents(),)),
          SizedBox(width: 20,),
          Container(width: 100, child: InkWell(child: Text("1:1문의하기 >", style: subContentsPointSmall(),)),)
        ],
      ),
    );
  }
}
