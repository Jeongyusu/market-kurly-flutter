import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/home/menu/best/best_body/best_body.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/kurly_body/hot_product_body.dart';

class HotProductScreen extends StatelessWidget {
  const HotProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HotProductBody(),
    );
  }
}
