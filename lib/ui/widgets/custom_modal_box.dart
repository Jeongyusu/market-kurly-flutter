import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class CustomModalBox extends StatelessWidget {
  final String text;
  const CustomModalBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: AlertDialog(
        title: Text(
          '${text}',
          style: subTitleSmall(),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
            child: Container(
              height: 40,
              child: TextButton(
                onPressed: () {
                  // 모달 창 닫기 로직
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ),
          ),
        ],
        elevation: 10.0,
        backgroundColor: basicColorW,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
