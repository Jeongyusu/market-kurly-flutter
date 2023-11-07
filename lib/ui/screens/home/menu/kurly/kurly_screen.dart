import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/home/menu/kurly/kurly_body/kurly_body.dart';

class KurlyScreen extends StatefulWidget {
  @override
  State<KurlyScreen> createState() => _KurlyScreenState();
}

class _KurlyScreenState extends State<KurlyScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  bool isSelected = false;

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  final List<String> imagePaths = [
    'assets/images/banner_01.png',
    'assets/images/banner_02.png',
    'assets/images/banner_03.png',
    'assets/images/banner_04.png',
  ];

  final List<String> bannerImages = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KurlyBody(
        scrollController: _scrollController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollToTop();
        },
        backgroundColor: basicColorW,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: bgAndLineColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(
          Icons.arrow_upward,
          color: primaryColor,
        ),
      ),
    );
  }
}
