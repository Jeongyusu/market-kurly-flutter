import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class CustomTopButton extends StatefulWidget {
  CustomTopButton({super.key});

  @override
  State<CustomTopButton> createState() => _CustomTopButtonState();
}

class _CustomTopButtonState extends State<CustomTopButton>
    with SingleTickerProviderStateMixin {
  final ScrollController? _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController?.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
