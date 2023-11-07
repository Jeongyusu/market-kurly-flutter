import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_rating.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_rating_bar_item.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_contents.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_img_list.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_bottom_sheet.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_area.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';
import 'package:intl/intl.dart';

class ProductReviewSaveScreen extends StatelessWidget {
  final TextEditingController? controller;
  const ProductReviewSaveScreen({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomNavAppBar(
            text: "후기 쓰기",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  ProductRating(),
                  ProductReviewContents(controller: controller),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CustomElevatedButton(
            funPageRoute: null,
            text: "등록",
          ),
        ),
      ),
    );
  }
}
