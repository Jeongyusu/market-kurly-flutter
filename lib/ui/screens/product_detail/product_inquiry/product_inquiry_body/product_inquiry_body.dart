import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/product_inquiry_save_screen.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/product_inquiry_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/widget/product_inquiry_title.dart';
import 'package:flutter_blog/ui/screens/user_question/user_question_form_screen.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../_core/constants/color.dart';

class ProductInquiryBody extends ConsumerWidget {
  const ProductInquiryBody({
    Key? key,
    required this.formattedDate,
  }) : super(key: key);

  final String formattedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: CustomTextButton(
              "상품 문의하기",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductInquirySaveScreen(),
                  ),
                );
              },
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 1,
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
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ProductInquiryTitle(
                    formattedDate: formattedDate,
                    inquiryTitle: '문의문의',
                    titleStyle: basicText(),
                    statusStyle: subContentsReqular(),
                    answerTitle: '답변대기',
                    inquiryName: '서태웅',
                  ),
                ),
                initiallyExpanded:
                    false, // Set to false for initially closed state
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
