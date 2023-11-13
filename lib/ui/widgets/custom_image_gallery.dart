import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CustomImageGallery extends StatefulWidget {
  final ValueNotifier<List<String>>? photoList;
  CustomImageGallery({Key? key, this.photoList}) : super(key: key);

  @override
  State<CustomImageGallery> createState() => _CustomImageGalleryState();
}

class _CustomImageGalleryState extends State<CustomImageGallery> {
  List<XFile> _images = [];
  List<String> encodedImages = [];
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      Uint8List bytedata = await pickedFile.readAsBytes();
      List<int> realBytes = bytedata.toList();
      String completeEncoded = base64Encode(realBytes);
      Logger().d(completeEncoded);

      setState(
        () {
          _images.add(XFile(pickedFile.path));
          List<XFile> bytedata = _images;

          encodedImages.add(completeEncoded);
          _images = bytedata;

          widget.photoList!.value = encodedImages;

          encodedImages = _images.map((image) => image.path).toList();
          Logger().d(encodedImages.length);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildButton(),
        SizedBox(height: smallGap, width: double.infinity),
        _buildPhotoArea(),
        SizedBox(height: smallGap),
      ],
    );
  }

  Widget _buildPhotoArea() {
    return _images.isNotEmpty
        ? Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 60,
                  height: 60,
                  child: Image.file(File(_images[index].path)),
                );
              },
            ),
          )
        : Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 60,
              height: 60,
            ),
          );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: bgAndLineColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            icon: Icon(
              Icons.add_a_photo,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: bgAndLineColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () async {
              getImage(ImageSource.gallery);
            },
            icon: Icon(
              Icons.add_photo_alternate_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
