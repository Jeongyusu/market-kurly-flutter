import 'package:flutter/material.dart';

import 'product_info_body/product_info_body.dart';

class ProductInfoScreen extends StatelessWidget {
  const ProductInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductInfoBody(),
    );
  }
}
