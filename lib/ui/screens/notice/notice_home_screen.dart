import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/ui/screens/notice/notice_detail_screen.dart';
import 'package:flutter_blog/ui/widgets/custom_simple_appbar.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_bold.dart';
import 'package:flutter_blog/ui/widgets/line/custom_line_thin.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoticeHomeScreen extends StatelessWidget {
  const NoticeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSimpleAppbar(
        title: Text(
          "공지사항",
          style: subTitleBold(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoticeDetailScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "[공지] MarketKurly",
                                  style: subContents(),
                                ),
                                Text(
                                  "2021-02-22",
                                  style: subContents(),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "[가격인하공지] [H'EATING] 제주 흑돈 크리스피 모짜렐라 핫도그",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      CustomLineThin(),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.arrow_forward_ios), label: ""),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.recycling_rounded), label: "")
      ],
    );
  }
}
