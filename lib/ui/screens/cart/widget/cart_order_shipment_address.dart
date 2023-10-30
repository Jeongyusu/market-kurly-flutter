import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CartOrderShipmentAddress extends StatelessWidget {
  const CartOrderShipmentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: disableColor,
                  ),
                  width: 80,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text("기본 배송지", style: greyToneButtonText(),)),
            ],
          ),
          SizedBox(height: 10,),
          Row(   children: [
            Container(
                width: 280,
                child: Text("부산시 부산진구 그린컴퓨터아카데미 k디지털", style: greyToneLargeText(),)),
            SizedBox(width: 20,),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(color: basicColorB7, width: 1.0), borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                child: Text("변경", style: basicText(),),
              ),
            ),
          ],),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
