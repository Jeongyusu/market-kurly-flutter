import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgItem extends StatelessWidget {
  final String svgImage;
  const CustomSvgItem({
    super.key,
    required this.svgImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: SvgPicture.asset(
        "assets/icons/$svgImage",
        width: 80,
        height: 80,
      ),
    );
  }
}
