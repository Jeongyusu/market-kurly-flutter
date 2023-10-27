import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/address/widget/address_detail_form.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_checkbox_item.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class AddressDetailSetForm extends StatelessWidget {
  KopoModel? model;
  AddressDetailSetForm({super.key, this.model});
  final datailAddress = TextEditingController();
  final receiver = TextEditingController();
  final receiverTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomNavAppBar(
            text: "배송지",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  AddressDetailTextForm(
                      hintText: "상세주소를 입력하세요",
                      title: "${model!.address}",
                      controller: datailAddress),
                  AddressDetailTextForm(
                      hintText: "받는사람 이름을 입력하세요",
                      title: "받으실분",
                      controller: receiver),
                  AddressDetailTextForm(
                      title: "연락처",
                      hintText: "연락처를 입력하세요",
                      controller: receiverTel),
                  SizedBox(height: 50),
                  Container(
                      child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckBoxItem(
                          text: "기본 배송지로 저장",
                          textStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  )),
                  CustomElevatedButton(
                    text: "저장",
                    funPageRoute: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
