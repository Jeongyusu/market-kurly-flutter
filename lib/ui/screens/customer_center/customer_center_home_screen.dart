import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/widgets/custom_simple_appbar.dart';

class CustomerCenterHomeScreen extends StatelessWidget {
  const CustomerCenterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(title: Text("고객센터", style: subTitleBold(),)),
    );
  }
}
