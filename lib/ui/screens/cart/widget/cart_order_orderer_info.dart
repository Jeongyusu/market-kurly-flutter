import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CartOrderOrdererInfo extends StatelessWidget {
  const CartOrderOrdererInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text("보내는 분", style: greyToneLargeText(),),
              SizedBox(width: 20,),
              Text("보내는 분 실제 데이터바인딩자리")
            ],
          ),
          SizedBox(height: 10,),
          Row(   children: [
            Text("휴대폰", style: greyToneLargeText(),),
            SizedBox(width: 20,),
            Text("휴대폰 실제 데이터바인딩자리")
          ],),
          SizedBox(height: 10,),
          Row(   children: [
            Text("이메일", style: greyToneLargeText(),),
            SizedBox(width: 20,),
            Text("보내는 분 실제 데이터바인딩자리")
          ],),
          SizedBox(height: 10,),
          Container(alignment: Alignment.topLeft,child: Text("주소지 정보 변경 방법 : 마이컬리 > 개인정보 수정", style: greyToneText(), )),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
