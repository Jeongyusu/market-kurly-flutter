import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/cart_save_dto.dart';
import 'package:flutter_blog/data/dto/model_dto/cart_dto/selected_option_dto.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/model/product.dart';
import 'package:flutter_blog/data/repository/cart_repsository.dart';
import 'package:flutter_blog/data/store/session_store.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_detail_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_cart_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCartBottomBar extends ConsumerWidget {
  final productId;
  const ProductCartBottomBar({
    super.key, this.productId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionStore sessionStore = ref.read(sessionProvider);
    ProductDetailModal? productDetailModel = ref.read(productCartProvider(productId));

    return Container(
      color: basicColorW,
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: primaryColor,
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            builder: (BuildContext context) {
              return ProductCartBottomSheet();
            },
          );
          List<SelectedOptionDTO> selectedOptionDTOList = productDetailModel!.selectedOptionDTOs.map((e) {
            return SelectedOptionDTO(e.id, e.optionQuantity);
          },).toList();
          CartDTORepository().saveCartList(sessionStore.jwt!, CartSaveDTO(selectedOptionDTOList));
        },
        child: Text(
          "장바구니 담기",
        ),
      ),
    );
  }
}
