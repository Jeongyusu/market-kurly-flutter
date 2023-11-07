import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';
import 'package:flutter_blog/_core/constants/font.dart';

class ProductReviewImgScreen extends StatefulWidget {
  const ProductReviewImgScreen({Key? key}) : super(key: key);

  @override
  State<ProductReviewImgScreen> createState() => _ProductReviewImgScreenState();
}

class _ProductReviewImgScreenState extends State<ProductReviewImgScreen> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/images/review_detail_img_01.png",
    "assets/images/review_detail_img_02.png",
    "assets/images/review_detail_img_03.png",
    "assets/images/review_detail_img_04.png",
    "assets/images/review_detail_img_05.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: basicColorW,
        title: Text(
          "상세보기",
          style: subTitleReqular(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: basicColorB5,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeaderPic(),
        ],
      ),
      bottomNavigationBar: _buildHeaderSelector(),
    );
  }

  Widget _buildHeaderPic() {
    return AspectRatio(
      aspectRatio: 1 / 1.3,
      child: Image.asset(
        selectedPic[selectedId],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildHeaderSelectorButton(0, selectedPic[selectedId]),
            _buildHeaderSelectorButton(1, selectedPic[selectedId]),
            _buildHeaderSelectorButton(2, selectedPic[selectedId]),
            _buildHeaderSelectorButton(3, selectedPic[selectedId]),
            _buildHeaderSelectorButton(4, selectedPic[selectedId]),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSelectorButton(int id, String reviewImg) {
    bool isSelected = selectedId == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedId = id;
        });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedPic[id]),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? primaryColor02 : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
