import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/coupon/coupon_view_model.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_main_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'body/my_info_body.dart';

class MyInfoScreen extends ConsumerWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(couponProvider.notifier).notifyInit();
    return Scaffold(
        appBar: CustomMainAppbar(
          title: Text(
            "마이컬리",
            style: appBarTitle(),
          ),
        ),
        body: MyInfoBody(),
    );
  }
}
