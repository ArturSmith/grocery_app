import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constants/consts.dart';

class MySwiper extends StatelessWidget {
  MySwiper({
    super.key,
  });
  final List<String> listOfImages = [
    'lib/assets/shop_pics/pexels-anna-shvets-3962285.jpg',
    'lib/assets/shop_pics/pexels-erik-scheel-95425.jpg',
    'lib/assets/shop_pics/pexels-matheus-cenali-2733918.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final screenWigth = Consts.screenSize(context).width;
    return SliverToBoxAdapter(
      child: SizedBox(
        width: screenWigth,
        height: screenWigth * 0.7,
        child: Swiper(
          itemCount: listOfImages.length,
          itemBuilder: (context, index) {
            return Image.asset(listOfImages[index], fit: BoxFit.fill);
          },
          autoplay: true,
        ),
      ),
    );
  }
}
