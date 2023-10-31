import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class BenefitScreen extends StatelessWidget {
  const BenefitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/benefit_img_01.png',
      'assets/images/benefit_img_02.png',
      'assets/images/benefit_img_03.png',
      'assets/images/benefit_img_04.png',
      'assets/images/benefit_img_05.png',
      'assets/images/benefit_img_06.png',
      'assets/images/benefit_img_07.png',
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        itemBuilder: (context, index) {
          return Container(
            height: 115,
            color: basicColorW,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: smallGap,
                    ),
                    InkWell(
                      onTap: () {
                        print("배너 클릭${images[index]}");
                      },
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: images.length,
      ),
    );
  }
}
