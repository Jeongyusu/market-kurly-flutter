import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/auth/join_screen/widgets/join_rich_text_item.dart';

enum Gender { MAN, WOMEN }

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int _counter = 0;
  var _ischecked = false;
  Gender _gender = Gender.MAN;

  @override
  void initState() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        JoinRichTextItem(
          text: "성별",
          strong: " *",
        ),
        SizedBox(
          height: xsmallGap,
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
              height: 30,
              child: Transform.scale(
                scale: 1.3,
                child: Radio(
                    value: Gender.MAN,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        if (value != null) {
                          _gender = value;
                        }
                      });
                    },
                    activeColor: primaryColor02),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "남자",
              style: basicText(),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 25,
              height: 30,
              child: Transform.scale(
                scale: 1.3,
                child: Radio(
                    value: Gender.WOMEN,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        if (value != null) {
                          _gender = value;
                        }
                      });
                    },
                    activeColor: primaryColor02),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "여자",
              style: basicText(),
            ),
          ],
        ),
      ],
    );
  }
}
