import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constants/consts.dart';

class MySwiper extends StatelessWidget {
  const MySwiper({super.key, required this.lisOfImages});
  final List<String> lisOfImages;

  @override
  Widget build(BuildContext context) {
    final screenWigth = Consts.screenSize(context).width;
    return SliverToBoxAdapter(
      child: SizedBox(
        width: screenWigth,
        height: screenWigth * 0.7,
        child: Swiper(
          itemCount: lisOfImages.length,
          itemBuilder: (context, index) {
            return Image.asset(lisOfImages[index], fit: BoxFit.fill);
          },
          autoplay: true,
        ),
      ),
    );
  }
}
