import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
import 'package:flutter_blog/ui/screens/my_info/body/my_info_update_view_model.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoUpdateBody extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final _userId = TextEditingController();
  final _userPassword = TextEditingController();
  final User? user;
  MyInfoUpdateBody({this.user, Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyInfoUpdateFormModel? myInfoUpdateFormModel =
        ref.watch(myInfoUpdateFormProvider);
    SessionStore? sessionStore = ref.read(sessionProvider);
    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "개인정보수정",
        style: subTitleReqular(),
      )),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "비밀번호 재확인",
                style: subTitleSmall(),
              ),
              SizedBox(
                height: xsmallGap,
              ),
              Text("회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.",
                  style: greyToneText()),
              SizedBox(
                height: mediumGap,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 350,
                  child: CustomJoinTextFormField(
                    text: "아이디",
                    placeholderText: "현재 아이디",
                    funValidator: validatePassword(),
                    controller: _userId,
                  ),
                ),
              ),
              SizedBox(
                height: xsmallGap,
              ),
              Container(
                  width: 350,
                  child: CustomJoinTextFormField(
                    changeFormData: (value) {
                      ref
                          .read(myInfoUpdateFormProvider.notifier)
                          .setUserPassword(value);
                    },
                    text: "비밀번호",
                    placeholderText: "현재 비밀번호를 입력하세요",
                    funValidator: validatePassword(),
                    controller: _userPassword,
                    obscureText: true,
                  )),
              SizedBox(
                height: mediumGap,
              ),
              Container(
                width: 350,
                child: CustomElevatedButton(
                  text: "확인",
                  funPageRoute: () {
                    UpdateCheckDTO updateCheckDTO = UpdateCheckDTO(
                      userId: sessionStore!.user!.userId,
                      userPassword: myInfoUpdateFormModel!.userPassword,
                    );
                    ref.read(sessionProvider).userUpdateCheck(updateCheckDTO);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
