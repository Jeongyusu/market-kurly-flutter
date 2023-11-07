import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_arrow_board.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_coupon.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_profile.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_shipment_address.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_main_appbar.dart';

import 'body/my_info_body.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomMainAppbar(
          title: Text(
            "마이컬리",
            style: appBarTitle(),
          ),
        ),
        body: MyInfoBody());
  }
}
