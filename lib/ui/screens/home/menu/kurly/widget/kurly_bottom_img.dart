import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';

class KurlyBottomImg extends StatelessWidget {
  const KurlyBottomImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: smallGap),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 12 / 9,
          child: Image.asset(
            "assets/images/main_bottom_img.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
