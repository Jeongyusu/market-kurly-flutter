import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/ui/screens/cart/cart_list_view_model.dart';
import 'package:flutter_blog/ui/screens/product_detail/product_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class ProductOptionCount extends ConsumerStatefulWidget {
  final int index;
  final productId;
  const ProductOptionCount({
    super.key,
    required this.index,
    this.productId
  });

  @override
  ConsumerState<ProductOptionCount> createState() => _ProductOptionCountState();
}

class _ProductOptionCountState extends ConsumerState<ProductOptionCount> {
  @override
  Widget build(BuildContext context) {
    ProductDetailModal? model = ref.watch(productCartProvider(widget.productId));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: bgAndLineColor),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  ref.read(productCartProvider(widget.productId).notifier).minusQuantity(widget.index);
                  Logger().d(model?.selectedOptionDTOs[widget.index].optionQuantity ?? 0);

                },
                child: SvgPicture.asset(
                  "assets/icons/minus.svg",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
                "${model!.selectedOptionDTOs[widget.index].optionQuantity}"),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  ref.read(productCartProvider(widget.productId).notifier).plusQuantity(widget.index);
                  Logger().d(model!.selectedOptionDTOs[widget.index].optionQuantity);
                },
                child: SvgPicture.asset(
                  "assets/icons/plus.svg",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
