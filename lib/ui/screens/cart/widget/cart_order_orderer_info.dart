import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/address/address_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartOrderOrdererInfo extends ConsumerWidget {
  const CartOrderOrdererInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore sessionStore = ref.read(sessionProvider);
    AddressListModel? addressListModel = ref.read(addressListProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "보내는 분",
                style: greyToneLargeText(),
              ),
              SizedBox(
                width: 20,
              ),
              Text("${sessionStore.user!.username}", style: subTitleSmall()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "휴대폰",
                style: greyToneLargeText(),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "${addressListModel!.addresses[0].receiverTel}",
                style: subTitleSmall(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "이메일",
                style: greyToneLargeText(),
              ),
              SizedBox(
                width: 20,
              ),
              Text("${addressListModel!.addresses[0].receiverName}",
                  style: subTitleSmall()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                "주소지 정보 변경 방법 : 마이컬리 > 개인정보 수정",
                style: greyToneText(),
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
