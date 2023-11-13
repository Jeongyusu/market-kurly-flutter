import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/data/dto/request_dto/review_request.dart';
import 'package:flutter_blog/data/store/param_store.dart';
import 'package:flutter_blog/data/store/parameter_store.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/product_review_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_form.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_review/widget/product_review_img_list.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_bottom_sheet.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_nav_appbar.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'product_review_body/product_review_save_body.dart';

class ProductReviewSaveScreen extends StatelessWidget {
  final TextEditingController? controller;
  final int? productId;
  final int? writeableReviewId;
  ProductReviewSaveScreen({
    Key? key,
    this.controller,
    this.productId,
    this.writeableReviewId,
  }) : super(key: key);

  ProductReviewForm productReviewForm = ProductReviewForm();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              CustomNavAppBar(
                text: "후기 쓰기",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SliverToBoxAdapter(child: productReviewForm),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  SessionStore? sessionStore = ref.read(sessionProvider);
                  return CustomElevatedButton(
                    funPageRoute: () async {
                      print("클릭");
                      productReviewForm.submit(ref);
                      ProductReviewSaveDTO proReviewDTO = ProductReviewSaveDTO(
                        productId: 1,
                        writeableReviewId: 1,
                        reviewContent: productReviewForm.reviewContent.text,
                        reviewPics: productReviewForm.reviewPics.value,
                        starCount: productReviewForm.starCount,
                      );
                      Logger().d(proReviewDTO.reviewContent);
                      Logger().d(proReviewDTO.starCount);
                      Logger().d(proReviewDTO.reviewPics);

                      //TODO - parameterStore use
                      ParameterStore parameterStore =
                          ref.read(parameterProvider);
                      parameterStore.productReviewSaveDTO = proReviewDTO;
                      SessionUser sessionUser = ref.read(sessionProvider);
                      await ref
                          .read(productReviewProvider.notifier)
                          .notifyAdd(sessionUser!.jwt);
                    },
                    text: "등록",
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
