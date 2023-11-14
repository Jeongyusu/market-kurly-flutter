import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_body/product_review_list_body.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_img_list.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_text_button.dart';
import 'package:flutter_blog/ui/widgets/icons_and_images/custom_review_icon.dart';
import 'package:flutter_blog/ui/widgets/text_items/custom_text_item.dart';
import 'package:intl/intl.dart';

import 'product_inquiry_body/product_inquiry_list_body.dart';

class ProductInquiryListScreen extends StatelessWidget {
  const ProductInquiryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());

    return Scaffold(
      backgroundColor: bgAndLineColor,
      body: ProductInquiryListBody(formattedDate: formattedDate),
    );
  }
}
