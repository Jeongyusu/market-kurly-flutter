import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_form_field.dart';

class MyInfoUpdateBody extends StatelessWidget {
  final formKey;
  final password;
  const MyInfoUpdateBody({super.key, required this.formKey, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(title: Text("개인정보 수정", style: subTitle(),)),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("비밀번호 재확인", style: subTitle(),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.", style: greyToneText()),
              ),
              Text("아이디", style: subTitle(),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(width: 350,
                    child: CustomTextFormField(placeholderText: "    현재 아이디", funValidator: validatePassword(), controller: password)),
              ),
              Text("비밀번호", style: subTitle(),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(width: 350,
                    child: CustomTextFormField(placeholderText: "    현재 비밀번호를 입력하세요", funValidator: validatePassword(), controller: password)),
              ),
              SizedBox(height: 10,),
              Container(width: 350,
                  child: CustomElevatedButton(text: "확인", funPageRoute: (){}))


            ],
          ),
        ),
      ),
    );;
  }
}
