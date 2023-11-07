import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/product_detail/widget/product_detail_appbar.dart';
import 'package:flutter_blog/ui/widgets/custom_option_count.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';

class CustomBottomAppbar extends StatelessWidget {
  final String text;
  final Function? funPageRoute;
  CustomBottomAppbar({
    Key? key,
    required this.text,
    this.funPageRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ElevatedButton(
          onPressed: funPageRoute as void Function()?,
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(50),
            backgroundColor: primaryColor,
          ),
          child: Text("$text"),
        ),
      ),
    );
  }
}
