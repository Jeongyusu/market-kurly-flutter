import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_arrow_board.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_coupon.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_profile.dart';
import 'package:flutter_blog/ui/screens/my_info/widget/my_info_shipment_address.dart';
import 'package:flutter_blog/ui/widgets/custom_main_appbar.dart';

class MyInfoBody extends StatelessWidget {
  const MyInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppbar(
        title: Text(
          "마이컬리",
          style: appBarTitle(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                MyInfoProfile(),
                MyInfoCoupon(),
                MyInfoShipmentAddress(),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: MyInfoArrowBoard(),
                ),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
