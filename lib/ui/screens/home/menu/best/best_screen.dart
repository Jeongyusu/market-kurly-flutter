import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/dto/model_dto/product_dto/product_dto.dart';
import 'package:flutter_blog/ui/screens/home/product_list_view_model.dart';
import 'package:flutter_blog/ui/widgets/product_items/custom_product_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BestScreen extends StatefulWidget {
  @override
  State<BestScreen> createState() => _BestScreenState();
}

class _BestScreenState extends State<BestScreen> {
  final List<String> imagePaths = [
    'assets/images/banner_01.png',
    'assets/images/banner_02.png',
    'assets/images/banner_03.png',
    'assets/images/banner_04.png',
  ];

  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  final List<String> _themeMode = <String>[
    'system',
    'dark',
    'light',
  ];

  String selectedTheme = 'system';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: basicColorW,
          titleSpacing: 0,
          actions: [
            Container(
              child: DropdownButton(
                value: selectedTheme,
                items: _themeMode.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text('$item'),
                    value: item,
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    selectedTheme = value;
                  });
                },
              ),
            )
          ],
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: CustomProductGrid(images: images),
        ),
      ],
    );
  }
}
