import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../constants/theme_style.dart';

class MySwiper extends StatelessWidget {
  MySwiper({super.key, required this.lisOfImages});
  final List<String> lisOfImages;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: SizedBox(
        width: size,
        height: size * 0.7,
        child: Swiper(
          itemCount: lisOfImages.length,
          itemBuilder: (context, index) {
            return Image.asset(lisOfImages[index], fit: BoxFit.fill);
          },
          autoplay: true,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  size: 10,
                  activeSize: 10,
                  color: ThemeStyles.setThemeColor(context, false),
                  activeColor: ThemeStyles.setThemeColor(context, true))),
        ),
      ),
    );
  }
}
