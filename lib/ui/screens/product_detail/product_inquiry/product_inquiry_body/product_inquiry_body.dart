import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_title.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';

import '../../../../../_core/constants/color.dart';

class ProductInquiryBody extends StatelessWidget {
  const ProductInquiryBody({
    super.key,
    required this.formattedDate,
  });

  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: CustomTextButton(
              "상품 문의하기",
              () {
                Navigator.pushNamed(context, Move.productInquirySaveScreen);
              },
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
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
                      formattedDate: formattedDate,
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
            );
          },
        ),
      ],
    );
  }
}
