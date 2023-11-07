import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSellerAndTitle extends ConsumerWidget {
  final String? sellerName;
  final String? productTitle;
  const ProductSellerAndTitle({
    super.key,
    this.sellerName,
    this.productTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductListModel? model = ref.watch(productNewListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: double.infinity,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${sellerName}",
                style: basicText(),
              ),
              WidgetSpan(
                child: SizedBox(width: smallGap),
              ),
              TextSpan(
                text: "${productTitle}",
                style: basicText(),
              ),
            ],
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }
}
