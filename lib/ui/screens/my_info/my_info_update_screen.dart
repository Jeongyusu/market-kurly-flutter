import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/utils/validator_util.dart';
import 'package:flutter_blog/ui/screens/my_info/body/my_info_update_body.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';
import 'package:flutter_blog/ui/widgets/appbar/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoUpdateScreen extends StatelessWidget {
  MyInfoUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInfoUpdateBody();
  }
}
