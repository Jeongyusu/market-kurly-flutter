import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/address/address_detail.dart';
import 'package:flutter_blog/ui/screens/address/address_setting.dart';
import 'package:flutter_blog/ui/screens/address/widget/address_caption.dart';
import 'package:flutter_blog/ui/widgets/custom_nav_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressBody extends ConsumerWidget {
  AddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 더미 데이터
    List<String> addresses = [
      "서울 관악",
      "부산 동래",
      "전남 광주",
      "경북 경산",
      "경기 김포",
      "제주 서귀포",
      "강원 태백",
      "경남 마산",
      "충북 청주",
      "충남 태안",
      "강원 동해",
      "전북 무주",
    ];

    return CustomScrollView(
      slivers: [
        CustomNavAppBar(
          text: "배송지 관리",
          onPressed: () {
            Navigator.pop(context);
          },
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressSetPage(),
                    ));
              },
              child: Text(
                "추가",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(minHeight: 35),
            child: AddressCaption(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: smallGap),
                        InkWell(
                          onTap: () {},
                          child: AddressDetail(
                            address: addresses[index],
                          ),
                        ),
                        SizedBox(height: smallGap),
                      ],
                    ),
                  )
                ],
              ),
            );
          }, childCount: addresses.length),
        )
      ],
    );
  }
}
