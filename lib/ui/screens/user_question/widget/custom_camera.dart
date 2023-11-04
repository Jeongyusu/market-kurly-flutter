import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomCamera extends StatefulWidget {// 가져온 사진들을 보여주기 위한 변수
  const CustomCamera({super.key});

  @override
  State<CustomCamera> createState() => _CustomCameraState();
}

class _CustomCameraState extends State<CustomCamera> {
  final picker = ImagePicker();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  List<XFile?> multiImage = []; // 갤러리에서 여러 장의 사진을 선택해서 저장할 변수
  List<XFile?> images = [];
  @override
  Widget build(BuildContext context) {
    return Row(children: [
        //카메라로 촬영하기
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 5)
              ],
            ),
            child: IconButton(
                onPressed: () async {
                  image = await picker.pickImage(source: ImageSource.camera);
                  //카메라로 촬영하지 않고 뒤로가기 버튼을 누를 경우, null값이 저장되므로 if문을 통해 null이 아닐 경우에만 images변수로 저장하도록 합니다
                  if (image != null) {
                    setState(() {
                      images.add(image);
                    });
                  }
                },
                icon: Icon(Icons.add_a_photo, size: 30, color: Colors.white,)
            )
        ),

//갤러리에서 가져오기
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 5)],
            ),
            child: IconButton(
                onPressed: () async {multiImage = await picker.pickMultiImage();
                setState(() {
                  //multiImage를 통해 갤러리에서 가지고 온 사진들은 리스트 변수에 저장되므로 addAll()을 사용해서 images와 multiImage 리스트를 합쳐줍니다.
                  images.addAll(multiImage);
                });
                },
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 30,
                  color: Colors.white,
                )
            )
        ),
      ],);
  }
}



