import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/main_screen.dart';
import 'package:flutter_blog/ui/widgets/button_items/button/custom_elavated_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(basicColorW),
        foregroundColor: MaterialStateProperty.all<Color>(basicColorB3),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: Row(
        children: [
          Text(
            '필터',
            style: basicTextSmall(),
          ),
          Image.asset(
            "assets/icons/filter.png",
            width: 20,
            height: 20,
          )
        ],
      ),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTabController(
                length: 2, // Number of tabs
                child: Column(
                  children: [
                    Container(
                      alignment:
                          Alignment.centerLeft, // Aligns the child to the left
                      child: Text(
                        "필터",
                        style: subTitleReqular(),
                      ),
                    ),
                    TabBar(
                      tabs: [
                        Tab(text: '브랜드'),
                        Tab(text: '가격'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for Tab 1
                          Column(
                            children: [
                              // RadioButton(),
                            ],
                          ),
                          Center(
                            child: const Text('Content for Tab 2'),
                          ),
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      text: '상품보기',
                      funPageRoute: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
