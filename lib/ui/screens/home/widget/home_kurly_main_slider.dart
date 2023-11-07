import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/color.dart';

class HomeKurlyMainSlider extends StatefulWidget {
  const HomeKurlyMainSlider({
    super.key,
  });

  @override
  State<HomeKurlyMainSlider> createState() => _HomeKurlyMainSliderState();
}

class _HomeKurlyMainSliderState extends State<HomeKurlyMainSlider>
    with SingleTickerProviderStateMixin {
  final SwiperController? _swiperController = SwiperController();

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

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.0,
      floating: false,
      pinned: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      stretch: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Swiper(
          controller: _swiperController,
          itemCount: imagePaths.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  left: 150.0,
                  child: IconButton(
                    onPressed: () {
                      _swiperController?.previous();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: basicColorW,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15.0,
                  right: 150.0,
                  child: IconButton(
                    onPressed: () {
                      _swiperController?.next();
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: basicColorW,
                    ),
                  ),
                )
              ],
            );
          },
          autoplay: true,
          autoplayDelay: 3000,
        ),
      ),
    );
  }
}
