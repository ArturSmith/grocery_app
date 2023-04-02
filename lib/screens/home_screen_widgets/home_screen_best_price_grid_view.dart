import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import 'home_screen_product_card.dart';

class HomeScreenBestPriceGridView extends StatelessWidget {
  const HomeScreenBestPriceGridView({super.key, required this.data});
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return HomeScreenProductCard(
              name: data[index][Str.NAME],
              image: data[index][Str.IMAGE],
              price: data[index][Str.PRICE],
              discount: data[index][Str.DISCOUNT],
            );
          },
          childCount: data.length,
        ),
      ),
    );
  }
}
