import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.onDateChanged});
  final ValueChanged<DateTime> onDateChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JoinRichTextItem(text: "생년월일"),
        SizedBox(
          height: smallGap,
        ),
        TextButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: basicColorW,
                    height: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime date) {
                        setState(() {
                          today = date;
                          widget.onDateChanged(today);
                        });
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            "${today.year}.${today.month}.${today.day}",
            style: basicText(),
          ),
        ),
      ],
    );
  }
}
