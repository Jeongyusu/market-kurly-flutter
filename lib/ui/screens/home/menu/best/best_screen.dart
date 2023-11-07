import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/screens/home/menu/best/best_body/best_body.dart';

class BestScreen extends StatelessWidget {
  const BestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BestBody(),
    );
  }
}
