import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/customer_center/body/customer_center_home_screen_body.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_arrow_board.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_sub_menu.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
          title: Text(
        "고객센터",
        style: subTitleBold(),
      )),
      body: CustomerCenterHomeScreenBody(),
    );
  }
}
