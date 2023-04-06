import 'package:flutter/material.dart';
import 'package:new_project/entitis/product.dart';
import '../../widgets/product_card.dart';

class HomeScreenBestPriceGridView extends StatelessWidget {
  const HomeScreenBestPriceGridView({super.key, required this.products});
  final List<Product> products;

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
            return ProductCard(
              color: Colors.red,
              name: products[index].name,
              image: products[index].image,
              price: products[index].price,
              discount: products[index].discount,
              id: products[index].id,
              count: products[index].count,
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
