import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_title.dart';
import 'package:flutter_blog/ui/widgets/custom_bottom_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_simple_appbar.dart';

class UserQuestionScreen extends StatelessWidget {
  const UserQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(title: Text("1:1문의", style: subTitleBold())),
      body: ListView.builder(
        itemCount: 5,
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
                  title: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              '비밀글입니다.',
                              style: subTitleSmall(),
                            ),
                            actions: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ProductInquiryTitle(
                        formattedDate: "!3!@#",
                        inquiryTitle: '문의문의',
                        titleStyle: basicText(),
                        statusStyle: subContentsReqular(),
                        answerTitle: '답변대기',
                        inquiryName: '서태웅',
                        secretIcon: Icons.lock_outline,
                      ),
                    ),
                  ),
                  initiallyExpanded: true,
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
      bottomNavigationBar: CustomBottomAppbar(text: "1:1문의", funPageRoute: (){}),);
  }
}
