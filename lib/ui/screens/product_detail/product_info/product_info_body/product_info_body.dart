import 'package:flutter/material.dart';

class ProductInfoBody extends StatelessWidget {
  const ProductInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AspectRatio(
        aspectRatio: 1 / 6.3,
        child: Container(
          child: Image.asset(
            "assets/images/product/product_info_01.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
