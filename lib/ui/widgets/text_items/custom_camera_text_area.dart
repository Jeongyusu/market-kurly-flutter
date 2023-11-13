import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/font.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/ui/screens/user_question/widget/user_question_camera.dart';
import 'package:flutter_blog/ui/widgets/custom_image_gallery.dart';

class CustomCameraTextArea extends StatelessWidget {
  final ValueNotifier<List<String>>? photoList;
  const CustomCameraTextArea({
    super.key,
    this.photoList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "· 상품과 무관한 내용이거나 음란 및 불법적인 내용은 통보없이 삭제될 수 있습니다.",
          style: subContentsSmaill(),
        ),
        Text(
          "· 사진은 최대 5장까지 등록가능합니다.",
          style: subContentsSmaill(),
        ),
        SizedBox(
          height: smallGap,
        ),
        Container(
          child: CustomImageGallery(photoList: photoList),
        ),
      ],
    );
  }
}
