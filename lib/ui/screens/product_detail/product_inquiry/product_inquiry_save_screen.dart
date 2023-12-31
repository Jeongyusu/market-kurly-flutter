import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/product_question_request.dart';
import 'package:flutter_blog/ui/screens/auth/login_screen/widgets/login_text_form_field.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_inquiry/product_inquiry_view_model.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_bottom_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/custom_check_box_item.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_camera_text_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductInquirySaveScreen extends ConsumerWidget {
  final TextEditingController? title;
  final TextEditingController? content;
  const ProductInquirySaveScreen({super.key, this.title, this.content});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomNavAppBar(
            text: "상품 문의",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "문의 내용",
                        style: basicTextSmallAndBold(),
                      ),
                      Container(
                        child: CustomLoginTextFormField(
                            placeholderText: "제목을 입력해주세요",
                            funValidator: validateContent(),
                            controller: title ?? TextEditingController()),
                      ),
                      Container(
                        height: 160,
                        child: CustomTextArea(
                            hintText: "문의하실 내용을 입력해주세요. (0/5,000)",
                            funValidator: validateContent(),
                            contents: content ?? TextEditingController()),
                      ),
                      SizedBox(
                        height: smallGap,
                      ),
                      CheckBoxItem(text: "비밀글로 문의하기"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: UserQuestionBottomAppbar(
        text: "등록하기",
        funPageRoute: () {
          ProductInquiryModel? inquiryModel = ref.read(productInquiryProvider);
          ProductQuestionSaveDTO productQuestionSaveDTO = ProductQuestionSaveDTO(inquiryModel!.selectedProductId!, title!.text, content!.text, true);
          ref.read(productInquiryProvider.notifier).saveProductInquiry(productQuestionSaveDTO);
          Navigator.pop(context);
        },
      ),
    );
  }
}
