// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/consts.dart';
import 'package:new_project/entities/product.dart';
import 'package:new_project/models/favorites_screen_model.dart';
import 'package:new_project/widgets/movable_string.dart';
import '../../widgets/product_card.dart';

class HomeScreenSection extends StatelessWidget {
  const HomeScreenSection(
      {super.key,
      required this.color,
      required this.products,
      required this.emptylistText,
      required this.movableStringText});
  final Color color;
  final Future products;
  final String movableStringText;
  final String emptylistText;

  @override
  Widget build(BuildContext context) {
    final readFavoritesmodel = context.read<FavoritesScreenModel>();
    final screenWidth = Consts.screenSize(context).width;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MovableString(text: movableStringText, color: color),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_right),
              Icon(Icons.arrow_right),
              Icon(Icons.arrow_right),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: screenWidth, minHeight: screenWidth * 0.1),
              child: FutureBuilder(
                future: products,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Widget body = const SizedBox.shrink();

                  if (snapshot.hasData) {
                    final products = snapshot.data as List<Product>;

                    if (products.isEmpty) {
                      body = FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            emptylistText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      );
                    } else {
                      body = GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(
                            color: color,
                            name: products[index].name,
                            image: products[index].image,
                            price: products[index].price,
                            discount: products[index].discount,
                            id: products[index].id,
                            count: products[index].count,
                            isSeasonal: products[index].isSeasonal,
                          );
                        },
                      );
                    }
                  } else {
                    body = Center(
                      child: CircularProgressIndicator(
                          color: Consts.isDark(context)
                              ? Colors.white
                              : AppColors.darkThemeBacgroundColor),
                    );
                  }
                  return body;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
