import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:new_project/constants/theme_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MySwiper();
  }
}

class MySwiper extends StatelessWidget {
  MySwiper({super.key});

  final List<String> images = [
    'lib/assets/shop_pics/pexels-anna-shvets-3962285.jpg',
    'lib/assets/shop_pics/pexels-erik-scheel-95425.jpg',
    'lib/assets/shop_pics/pexels-matheus-cenali-2733918.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return SizedBox(
      width: size,
      height: size * 0.7,
      child: Swiper(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(images[index], fit: BoxFit.fill);
        },
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                size: 15,
                activeSize: 20,
                color: ThemeStyles.setColor(context, false),
                activeColor: ThemeStyles.setColor(context, true))),
      ),
    );
  }
}
