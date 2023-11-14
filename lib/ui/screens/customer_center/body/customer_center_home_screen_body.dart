import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_sub_menu.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';

class CustomerCenterHomeScreenBody extends StatelessWidget {
  const CustomerCenterHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLineBold(),
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("궁금한 점이 있으신가요?", style: subContents()),
              Text("1:1문의에 남겨주시면 답변 드리겠습니다.", style: subContents()),
              SizedBox(
                height: 20,
              ),
              CustomElevatedButton(text: "1:1문의 작성", funPageRoute: () {}),
            ],
          ),
        ),
        CustomLineBold(),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              MyInfoSubMenu(
                leftText: "1:1문의",
                route: Move.customerQuestionScreen,
              ),
              MyInfoSubMenu(
                leftText: "공지사항",
                route: Move.customerNoticeHomeScreen,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
