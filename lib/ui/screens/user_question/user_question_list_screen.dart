import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_title.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_body/product_review_list_body.dart';
import 'package:flutter_blog/ui/screens/user_question/body/user_question_list_body.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_bottom_appbar.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:intl/intl.dart';

class CustomerQuestionListScreen extends StatelessWidget {
  const CustomerQuestionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());

    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "내가 문의한 목록",
        style: subTitleBold(),
      )),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: bgAndLineColor,
                      width: 1,
                    ),
                  ),
                ),
                child: ExpansionTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ProductInquiryTitle(
                      formattedDate: formattedDate,
                      inquiryTitle: '문의문의',
                      titleStyle: basicText(),
                      statusStyle: subContentsReqular(),
                      answerTitle: '답변대기',
                      inquiryName: '백종원',
                    ),
                  ),
                  initiallyExpanded:
                      false, // Set to false for initially closed state
                  trailing: SizedBox.square(),
                  children: <Widget>[
                    ProductInquiryContents(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      // CustomerQuestionListBody(formattedDate: formattedDate),
      bottomNavigationBar: UserQuestionBottomAppbar(
        text: "확인",
        funPageRoute: () {
          Navigator.pushNamed(context, Move.customerHomeScreen);
        },
      ),
    );
  }
}
