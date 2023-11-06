import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/user_request.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/join_form_view_model.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_gender_radio_button.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_term_agreement.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_text_form_field.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/custom_date_picker.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_radio_button_item.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class JoinForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinFormModel? joinFormModel = ref.watch(joinFormProvider);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomJoinTextFormField(
                    changeFormData: (value) {
                      ref.read(joinFormProvider.notifier).setUserId(value);
                    },
                    text: "아이디",
                    strong: " *",
                    placeholderText: "아이디를 입력해주세요",
                    obscureText: false,
                    funValidator: validateUsername(),
                  ),
                ),
                SizedBox(
                  width: smallGap,
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(13),
                      child: Align(
                        alignment: Alignment.center,
                        child:
                            Text("중복확인", style: TextStyle(color: primaryColor)),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            width: 150,
                            child: AlertDialog(
                              title: Text(
                                '사용할 수 없는 아이디입니다.',
                                style: subTitleSmall(),
                              ),
                              actions: [
                                Container(
                                  height: 40,
                                  child: TextButton(
                                    onPressed: () {
                                      // 모달 창 닫기 로직
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ),
                              ],
                              elevation: 10.0,
                              backgroundColor: basicColorW,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            changeFormData: (value) {
              ref.read(joinFormProvider.notifier).setUserPassword(value);
            },
            text: "비밀번호",
            strong: " *",
            placeholderText: "비밀번호를 입력해주세요",
            obscureText: false,
            funValidator: validatePassword(),
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            changeFormData: (value) {
              ref.read(joinFormProvider.notifier).setUserConfirmPassword(value);
            },
            text: "비밀번호 확인",
            strong: " *",
            placeholderText: "비밀번호를 한번 더 입력해주세요",
            obscureText: true,
            funValidator: validatePassword(),
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            changeFormData: (value) {
              ref.read(joinFormProvider.notifier).setUsername(value);
            },
            text: "이름",
            strong: " *",
            placeholderText: "이름을 입력해주세요",
            obscureText: true,
            funValidator: validateUsername(),
          ),
          const SizedBox(height: mediumGap),
          CustomJoinTextFormField(
            changeFormData: (value) {
              ref.read(joinFormProvider.notifier).setUserEmail(value);
            },
            text: "이메일",
            strong: " *",
            placeholderText: "예) marketkurly@kurly.com",
            obscureText: true,
            funValidator: validateEmail(),
          ),
          const SizedBox(height: mediumGap),
          DatePicker(),
          const SizedBox(height: mediumGap),
          JoinGenderRadioButton(),
          const SizedBox(height: mediumGap),
          CustomLineBold(),
          const SizedBox(height: mediumGap),
          JoinTermAgreement(),
          const SizedBox(height: mediumGap),
          CustomElevatedButton(
            text: "가입하기",
            funPageRoute: () {
              Logger().d("나여기 ${joinFormModel}");

              JoinReqDTO joinReqDTO = JoinReqDTO(
                  userId: joinFormModel!.userId,
                  userPassword: joinFormModel!.userPassword,
                  username: joinFormModel!.username,
                  userEmail: joinFormModel!.userEmail,
                  userBirth: joinFormModel?.userBirth ?? null,
                  userGender: joinFormModel?.userGender ?? null,
                  role: "NORMAL");

              ref.read(sessionProvider).join(joinReqDTO);
              Navigator.pushNamed(context, Move.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
